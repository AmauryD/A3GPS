#include "..\macros.h"
/**
  @Author : [Utopia] Amaury
  @Creation : 5/02/17
  @Modified : 6/02/17
  @Description : functions to create the markers and the arrows on the map with a node path
**/

params [
	["_path",[],[[]]]
];

private	_fullPath = [];

private _fn_findInSegment = {
	params ["_segment","_road"];
	private _return = [];
	{
		if(_x select 0 isEqualTo _road) exitWith {
			_return = _x select 1;
		};
	}foreach _segment;
	_return
};

{
	_point = _x;
	_nextPoint = _path select (_forEachIndex + 1);

	if !(isNil "_nextPoint") then {
		_theSegment = [gps_roadSegments,str _point] call misc_fnc_hashTable_find;

		_theSegment = [_theSegment,_nextPoint] call _fn_findInSegment;

		if(_theSegment isEqualTo []) then {
			_fullPath pushBack _point;
		};

		{
			_fullPath pushBack _x;
		}foreach _theSegment;
	};
}forEach _path;

_fullPath