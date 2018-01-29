#include "macros.h"
/**
  @Author : [Utopia] Amaury
  @Creation : 8/06/17
  @Modified : 25/12/17
  @Description : 
  @Return : ARRAY - Array of road nodes
**/

params [
	["_startRoute",objNull,[objNull]],
	["_goalRoute",objNull,[objNull]]
];

private _came_from = [_startRoute,_goalRoute,gps_allCrossRoadsWithWeight] call gps_core_fnc_aStar;

if(_came_from isEqualTo []) then { throw "PATH_NOT_FOUND" };

private _current = _goalRoute;
private _path = [];

while {_current != _startRoute} do {
  _path pushBack _current;
  _current = [_came_from,str _current] call misc_fnc_hashTable_find;

  // if something went wrong
  if (isNil "_current") then { throw "PATH_NOT_FOUND" };
};

_path pushBack _startRoute;
reverse _path;

_path