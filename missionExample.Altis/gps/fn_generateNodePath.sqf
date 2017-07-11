/**
  @Author : [Utopia] Amaury
  @Creation : 8/06/17
  @Modified : 8/06/17
  @Description : 
**/

private _startRoute = param [0,objNull,[objNull]];
private _goalRoute = param [1,objNull,[objNull]];

private _gps_namespace = [count gps_allRoads] call misc_fnc_hashTable_create;

private _open_list = [_startRoute,_goalRoute,_gps_namespace] call gps_fnc_AStar;
private _open_list_str = _open_list apply {str (_x select 1)};
reverse _open_list_str;

if(count _open_list isEqualTo 0) then {
	throw "PATH_NOT_FOUND";
};

_current = _open_list select (count _open_list - 1);
private _path = [];
_path pushBack (_current select 1);

while{!((_current select 1) isEqualTo _startRoute)} do {
  _path pushBack (_current select 1);
  _current = [_gps_namespace,parseNumber str (_current select 0)] call misc_fnc_hashTable_find;
};

_path pushBack (_current select 1);
reverse _path;

_path