#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 23/10/17
	@Description : generate a path to a point A to point B
	NOW SUPPORTS multi-points PATH like A-B-C-D-E-...-J
	Path with a lot way points can lead to unexpected behavior
**/
scriptName "gps_main_thread";
scopeName "main";

_valid = params [
	["_position",[],[[],objNull,locationNull,grpNull,""]]
];

if (!_valid) exitWith {};

if(!gps_init_done) exitWith	{hintSilent	(["STR_GPS_NOT_LOADED"] call misc_fnc_localize)};

if (_position isEqualType []) then {
	if !(_position isEqualTypeAll 0) then {
		_position = _position apply {_x call bis_fnc_position};
	}else{
		_position = [_position call bis_fnc_position];
	};
}else{
	_position = [_position call bis_fnc_position];
};

_position = _position apply {[_x,1000] call bis_fnc_nearestRoad};
_hasNullRoad = ({isNull _x}count _position) > 0;

private _startRoute = [getPosATL vehicle player,1000] call bis_fnc_nearestRoad;
private _endRoute = _position select (count _position - 1);

if (_hasNullRoad) exitWith {hintSilent (["STR_NO_VALID_END_ROAD"] call misc_fnc_localize)};
if (isNull _startRoute) exitWith {hintSilent (["STR_NO_VALID_START_ROAD"] call misc_fnc_localize)};

[] call gps_fnc_killGPS;

gps_curr_thread = _thisScript;

[["STR_INIT"] call misc_fnc_localize] call gps_menu_fnc_setGPSInfo;

[] call gps_fnc_deletePathHelpers;

[_startRoute] call gps_fnc_insertFakeNode;

{ 
	[_x] call gps_fnc_insertFakeNode;
}foreach _position;

private _color = ["marker_color"] call misc_fnc_getSetting;

try {
	gps_current_goal = getPosATL _endRoute;

	waitUntil {
		_startRoute = [getPosATL vehicle player,1000] call bis_fnc_nearestRoad;
		[_startRoute] call gps_fnc_insertFakeNode;
		[] call gps_fnc_deletePathHelpers;

		private _path = [];
		{
			_foreach_start = _position param [_forEachIndex - 1,_startRoute];
			_foreach_goal = _x;

			_path append (
				[_foreach_start,_foreach_goal] call gps_fnc_generateNodePath
			);
		}foreach _position;

		private _fullPath = [_path] call gps_fnc_generatePathHelpers;
		[] call gps_menu_fnc_openHud;
		[_path,_fullPath,_endRoute] call gps_fnc_tracking;
	};
	
	hintSilent (["STR_ARRIVED"] call misc_fnc_localize);
	[] call gps_menu_fnc_closeHud;
	[] call gps_fnc_deletePathHelpers;

	gps_current_goal = nil;
}catch{
	switch _exception do { 
		case "PATH_NOT_FOUND" : {
			[] call gps_fnc_deletePathHelpers;
			[] call gps_menu_fnc_closeHud;
			hintSilent (["STR_PATH_NOT_FOUND"] call misc_fnc_localize);
		}; 
	};
	[_exception] call gps_fnc_log;
};

[] call gps_fnc_deleteNameSpaces;