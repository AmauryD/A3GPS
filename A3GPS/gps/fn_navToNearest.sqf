private _position = _this select 0;

if !(gps_curr_thread isEqualTo scriptNull) exitWith {};

private _nearestStartNodeObject = [player,player nearRoads 100] call misc_fnc_nearestPos;
private _nearestEndNodeObject = [_position,_position nearRoads 100] call misc_fnc_nearestPos;

[_nearestStartNodeObject] call gps_fnc_insertFakeNode;
[_nearestEndNodeObject] call gps_fnc_insertFakeNode;

gps_curr_thread = _thisScript;

try {
	_path = [_nearestStartNodeObject,_nearestEndNodeObject] call gps_fnc_generateNodePath;
	_fullPath = [_path] call gps_fnc_generatePathHelpers;
	[] spawn gps_menu_fnc_runHud;
	[_thisScript,_nearestEndNodeObject] spawn gps_fnc_waitArrive;
	[_path,_fullPath] call gps_fnc_tracking;
}catch{
	systemChat str _exception;
};
