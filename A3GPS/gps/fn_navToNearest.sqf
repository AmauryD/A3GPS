_objType = _this select 0;

_objs = nearestObjects [vehicle player, [_objType], 5000]; // a bit laggy but runned once , nearestObject seems to get only the nearest Loaded object

_obj = [vehicle player,_objs] call misc_fnc_nearestPos;

if(isNull _obj) exitWith {};
if !(gps_curr_thread isEqualTo scriptNull) exitWith {};

systemChat "ok";

gps_curr_thread = _thisScript;

private _nearestStartNodeObject = [player,player nearRoads 100] call misc_fnc_nearestPos;
private _nearestEndNodeObject = [_obj,_obj nearRoads 100] call misc_fnc_nearestPos;

[_nearestStartNodeObject,roadsConnectedTo _nearestStartNodeObject] call gps_fnc_mapNodeValues;
_res = [_nearestEndNodeObject,roadsConnectedTo _nearestEndNodeObject] call gps_fnc_mapNodeValues;

[nil,getPosATL _nearestEndNodeObject,"Arrivée"] call misc_fnc_createMarker;

try {
_path = [_nearestStartNodeObject,_nearestEndNodeObject,1] call gps_fnc_generateNodePath;

_fullPath = [_path] call gps_fnc_generatePathHelpers;
[] spawn gps_menu_fnc_runHud;
}catch{
	systemChat str _exception;
};

systemChat "done";