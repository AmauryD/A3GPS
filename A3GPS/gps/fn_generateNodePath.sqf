#include "..\macros.h"
/**
  @Author : [Utopia] Amaury
  @Creation : 8/06/17
  @Modified : 8/06/17
  @Description : 
**/

params [
	["_startRoute",objNull,[objNull]],
	["_goalRoute",objNull,[objNull]]
];

private _gps_namespace = [MAX_ROAD_INDEX] call misc_fnc_hashTable_create;

private _open_list = [_startRoute,_goalRoute,_gps_namespace] call gps_fnc_AStar;

if(count _open_list isEqualTo 0) then {
	throw "PATH_NOT_FOUND";
};

_current = _open_list select (count _open_list - 1);
private _path = [];
_path pushBack (_current select 1);

while{!((_current select 1) isEqualTo _startRoute)} do {
  systemChat format ["%1|%2",_current,diag_tickTime];
  _path pushBack (_current select 1);
  _current = [_gps_namespace,parseNumber str (_current select 0)] call misc_fnc_hashTable_find;
};

_path pushBack (_current select 1);
reverse _path;

_path