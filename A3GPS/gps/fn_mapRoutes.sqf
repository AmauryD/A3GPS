#include "..\macros.h"
/**
  @Author : [Utopia] Amaury
  @Creation : 1/02/17
  @Modified : 22/10/17
  @Description :trying to make a virtual map because arma road system ...
  				this file has changed so much ...
**/
scriptName "gps_virtual_mapping";

_start = diag_tickTime;
[format [["STR_LOG_VMAP_INIT_START"] call misc_fnc_localize]] call gps_fnc_log;

["getting roads ..."] call gps_fnc_log;
gps_allRoads = [] call gps_fnc_getAllRoads;
["done in " + str round (diag_tickTime - _start)] call gps_fnc_log;

private _gps_allRoadsWithInter = [];
private _gps_allCrossRoads = [];

gps_allCrossRoadsWithWeight = ["gps_allCrossRoadsWithWeight"] call misc_fnc_hashTable_create;
gps_roadsWithConnected =  ["gps_roadsWithConnected"] call misc_fnc_hashTable_create;

["mapping road intersect ..."] call gps_fnc_log;

_gps_allRoadsWithInter = gps_allRoads apply { //FINALLY FIXED THIS 
  private _road = _x;
  private _near = getPosATL _road nearRoads 14;
  private _connected = roadsConnectedTo _road;

  {
     if(count (roadsConnectedTo _x) == 1) then {
        _rID = str _x;
        _connected pushBack _x;
        if([gps_roadsWithConnected,_rID] call misc_fnc_hashTable_exists) then {
          ([gps_roadsWithConnected,_rID] call misc_fnc_hashTable_find) pushBack _road;
        }else{
          [gps_roadsWithConnected,_rID,[_road]] call misc_fnc_hashTable_set;
        };
     };
  }foreach ((_near - _connected) - [_road]);
  
  _currentConnected = [gps_roadsWithConnected,str _road] call misc_fnc_hashTable_find;
  if(isNil "_currentConnected") then {
      [gps_roadsWithConnected,str _road,_connected] call misc_fnc_hashTable_set;
  }else{
      _currentConnected append _connected;
  };
  [_road,_connected]
};

["done in " + str round (diag_tickTime - _start)] call gps_fnc_log;
["mapping node values ..."] call gps_fnc_log;

// FSM call (unscheduled) should speed up a little the thing , no frames were lost on my side
_fsmPath = gps_dir + "call.fsm";

{
  _connected = [gps_roadsWithConnected,str (_x select 0)] call misc_fnc_hashTable_find;
  if (count _connected > 2) then {
    [_x,gps_fnc_mapNodeValues] execFSM _fsmPath;
    uiSleep 0.01;
  };
  true
}count _gps_allRoadsWithInter;


[format["Loaded : %1 roads",count gps_allRoads]] call gps_fnc_log;

[format [["STR_LOG_VMAP_INIT_DONE"] call misc_fnc_localize,round (diag_tickTime - _start)]] call gps_fnc_log;

gps_init_done = true;
[missionNameSpace,"gps_loaded",[]] call BIS_fnc_callScriptedEventHandler;