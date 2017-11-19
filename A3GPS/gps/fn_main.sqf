#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 23/10/17
	@Description : main
**/
scriptName "gps_main_thread";
scopeName "main";

private "_path";
private _saveName = "";
private _startRoute = [getPosATL player,1000] call misc_fnc_nearestRoad;
private _endRoute = [_this,1000] call misc_fnc_nearestRoad;

if(!gps_init_done) exitWith	{hintSilent	(["STR_GPS_NOT_LOADED"] call misc_fnc_localize)};
if(isNull _endRoute) exitWith {hintSilent (["STR_NO_VALID_END_ROAD"] call misc_fnc_localize)};
if(isNull _startRoute) exitWith {hintSilent (["STR_NO_VALID_START_ROAD"] call misc_fnc_localize)};

[] call gps_fnc_killGPS;

gps_curr_thread = _thisScript;

_start = diag_tickTime;

[["STR_INIT"] call misc_fnc_localize] call gps_menu_fnc_setGPSInfo;

[] call gps_fnc_deletePathHelpers;

private _nearestStartNodeObject = _startRoute;
private _nearestEndNodeObject = _endRoute;

[_nearestStartNodeObject] call gps_fnc_insertFakeNode;
[_nearestEndNodeObject] call gps_fnc_insertFakeNode;

private _color = ["markers_color"] call misc_fnc_getSetting;

[nil,getPosATL _nearestStartNodeObject,["STR_START"] call misc_fnc_localize,"mil_dot",_color] call gps_fnc_createMarker;
[nil,getPosATL _nearestEndNodeObject,["STR_GOAL"] call misc_fnc_localize,"mil_flag",_color] call gps_fnc_createMarker;

[_thisScript,_nearestEndNodeObject] spawn gps_fnc_waitArrive;

_path = [_nearestStartNodeObject,_nearestEndNodeObject] call gps_fnc_generateNodePath;

gps_current_goal = getPosATL _nearestEndNodeObject;

_fullPath = [_path] call gps_fnc_generatePathHelpers;

[] spawn gps_menu_fnc_openHud;

[_path,_fullPath] call gps_fnc_tracking;

gps_current_goal = nil;