#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 23/10/17
	@Description : load a saved path from profileNameSpace
**/
params [
	["_name","",[""]]
];

private _theRightPath = [];
private _color = ["markers_color"] call misc_fnc_getSetting;

terminate gps_curr_thread;
[] call gps_fnc_deletePathHelpers;

{
	_savedName = _x select 0;

	if(_name isEqualTo _savedName) then {
		_theRightPath = _x;
	};
}foreach (profileNamespace getVariable ["gps_saved",[]]);

gps_curr_thread = _thisScript;

_startRoad = roadAt (_theRightPath select 1);
_endRoad = roadAt (_theRightPath select 2);

[nil,getPosATL _startRoad,["STR_START"] call misc_fnc_localize,"mil_dot",_color] call gps_fnc_createMarker;
[nil,getPosATL _endRoad,["STR_GOAL"] call misc_fnc_localize,"mil_flag",_color] call gps_fnc_createMarker;

_nodesPath = (_theRightPath select 3) apply {[_x,gps_onlyCrossRoads] call misc_fnc_nearestPos}; //roadAt does not work properly , we need to find the nearest crossRoad

[["STR_LOAD_SAVED_PATH"] call misc_fnc_localize] call gps_menu_fnc_setGPSInfo;
_fullPath = [_nodesPath] call gps_fnc_generatePathHelpers;
[["STR_SAVED_PATH_LOADED"] call misc_fnc_localize] call gps_menu_fnc_setGPSInfo;
[_thisScript,_endRoad] spawn gps_fnc_waitArrive;
[] spawn gps_menu_fnc_openHud;

[_nodesPath,_fullPath] call gps_fnc_tracking;
