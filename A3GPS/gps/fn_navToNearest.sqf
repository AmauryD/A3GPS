#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 23/10/17
	@Description : 
**/

params ["_position"];

if !(gps_curr_thread isEqualTo scriptNull) exitWith {
	hintSilent (["STR_ALREADY_LOADING"] call misc_fnc_localize);
};

gps_curr_thread = _thisScript;

private _nearestStartNodeObject = [player,player nearRoads 100] call misc_fnc_nearestPos;
private _nearestEndNodeObject = [_position,_position nearRoads 100] call misc_fnc_nearestPos;

[_nearestStartNodeObject] call gps_fnc_insertFakeNode;
[_nearestEndNodeObject] call gps_fnc_insertFakeNode;

try {
	_path = [_nearestStartNodeObject,_nearestEndNodeObject] call gps_fnc_generateNodePath;
	_fullPath = [_path] call gps_fnc_generatePathHelpers;
	[] spawn gps_menu_fnc_runHud;
	[_thisScript,_nearestEndNodeObject] spawn gps_fnc_waitArrive;
	[_path,_fullPath] call gps_fnc_tracking;
}catch{
	systemChat str _exception;
};
