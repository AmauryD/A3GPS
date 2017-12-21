#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 23/10/17
	@Description : main
**/
scriptName "gps_main_thread";
scopeName "main";

_valid = params [
	["_position",[],[[],objNull,locationNull]]
];

if (!_valid) exitWith {};

_position = switch (typeName _position) do { 
	case "ARRAY" : { _position }; 
	case "OBJECT" : { getPosATL _position }; 
	case "LOCATION" : { locationPosition _position };
};

private _startRoute = [getPosATL vehicle player,1000] call bis_fnc_nearestRoad;
private _endRoute = [_position,1000] call bis_fnc_nearestRoad;

if(!gps_init_done) exitWith	{hintSilent	(["STR_GPS_NOT_LOADED"] call misc_fnc_localize)};
if(isNull _endRoute) exitWith {hintSilent (["STR_NO_VALID_END_ROAD"] call misc_fnc_localize)};
if(isNull _startRoute) exitWith {hintSilent (["STR_NO_VALID_START_ROAD"] call misc_fnc_localize)};

[] call gps_fnc_killGPS;

gps_curr_thread = _thisScript;

[["STR_INIT"] call misc_fnc_localize] call gps_menu_fnc_setGPSInfo;

[] call gps_fnc_deletePathHelpers;

[_startRoute] call gps_fnc_insertFakeNode;
[_endRoute] call gps_fnc_insertFakeNode;

private _color = ["markers_color"] call misc_fnc_getSetting;

[nil,getPosATL _startRoute,["STR_START"] call misc_fnc_localize,"mil_dot",_color] call gps_fnc_createMarker;
[nil,getPosATL _endRoute,["STR_GOAL"] call misc_fnc_localize,"mil_flag",_color] call gps_fnc_createMarker;

try {
	private _path = [_startRoute,_endRoute] call gps_fnc_generateNodePath;

	gps_current_goal = getPosATL _endRoute;

	private _fullPath = [_path] call gps_fnc_generatePathHelpers;
	[] call gps_menu_fnc_openHud;

	if([_path,_fullPath,_endRoute] call gps_fnc_tracking) then {
		[] call gps_fnc_deletePathHelpers;
		hintSilent (["STR_ARRIVED"] call misc_fnc_localize);
		[] call gps_menu_fnc_closeHud;
	};
	gps_current_goal = nil;
}catch{
	switch (_exception) do { 
		case "PATH_NOT_FOUND" : {
			[] call gps_fnc_deletePathHelpers;
			[] call gps_menu_fnc_closeHud;
		}; 
		case "RECALCULATE_PATH":{
			[] call gps_fnc_deletePathHelpers;
			[] call gps_menu_fnc_closeHud;
			[] call gps_fnc_killGPS;
		};
	};
	[_exception] call gps_fnc_log;
};