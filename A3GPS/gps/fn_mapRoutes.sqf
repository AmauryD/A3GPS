#include "..\macros.h"
/**
  @Author : [Utopia] Amaury
  @Creation : 1/02/17
  @Modified : 5/02/17
  @Description :trying to make a virtual map because arma road system ...
  				this file has changed so much ...
**/
scriptName "gps_virtual_mapping";

_start = diag_tickTime;
[format [["STR_LOG_VMAP_INIT_START"] call misc_fnc_localize]] call gps_fnc_log;

gps_data_map_center = [worldSize / 2,worldSize / 2,0];

call compile preprocessFileLineNumbers format [gps_dir + "gps\data\%1.sqf",worldName];

gps_allRoads = [] call gps_fnc_getAllRoads;

_max_road_index = (gps_allRoads apply {parseNumber str _x});
_max_road_index sort false;
gps_max_road_index = _max_road_index select 0;

gps_allRoadsWithInter = [];
gps_allCrossRoads = [];
gps_allCrossRoadsWithWeight = [gps_max_road_index] call misc_fnc_hashTable_create;
gps_onlyCrossRoads = [];
gps_roadSegments = [gps_max_road_index] call misc_fnc_hashTable_create;
gps_roadsWithConnected =  [gps_max_road_index] call misc_fnc_hashTable_create;

gps_alreadyLinked = []; // is this used ?

gps_allRoadsWithInter = gps_allRoads apply {
  private _road = _x;
  private _near = getPosATL _road nearRoads 17;
  private _connected = roadsConnectedTo _road;
  /**	=> generates way too much nodes , algorithm is dying with that
  {
     if (!(_x in _connected) && !(_x isEqualTo _road)) then {
        if(count roadsConnectedTo _x < 3) then {
          _connected pushBackUnique _x;
        };
     };
  }foreach _near;
  **/
  [gps_roadsWithConnected,parseNumber str _road,_connected] call misc_fnc_hashTable_set;
  [_road,_connected]
};

{ //fix for one-way connected roads , thx god , that fixed every problems
  if(count ([_x] call gps_fnc_roadsConnectedTo) < 2) then {
    private _route = _x;
    private _routeConnected = [gps_roadsWithConnected,parseNumber str _route] call misc_fnc_hashTable_find;
    private _nearRoads = _route nearRoads 17;

    {
      _road = _x;
      _connected = [gps_roadsWithConnected,parseNumber str _road] call misc_fnc_hashTable_find;

      if(_route in _connected) then {
        _routeConnected pushBackUnique _road;
      };
    }foreach _nearRoads;
    [gps_roadsWithConnected,parseNumber str _route,_routeConnected] call misc_fnc_hashTable_set;
  };
}foreach gps_allRoads;

{
  _connected = [gps_roadsWithConnected,parseNumber str (_x select 0)] call misc_fnc_hashTable_find;
  if(count _connected > 2) then {gps_allCrossRoads pushBack _x};
} forEach gps_allRoadsWithInter;

gps_onlyCrossRoads = gps_allCrossRoads apply {_x select 0};

{
    _x call gps_fnc_mapNodeValues;
}foreach gps_allCrossRoads;

[format["Loaded : %1 roads|%2 crossroads|%3 road segments",count gps_allRoads,count gps_onlyCrossRoads,count gps_roadSegments]] call gps_fnc_log;

[format [["STR_LOG_VMAP_INIT_DONE"] call misc_fnc_localize,round (diag_tickTime - _start)]] call gps_fnc_log;