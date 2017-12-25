#include "..\..\..\macros.h"

#define RID(road) parseNumber str road

params ["_startRoute","_goalRoute"];

private _frontier = [];
private _came_from = [gps_max_road_index] call misc_fnc_hashTable_create;
private _cost_so_far = [gps_max_road_index] call misc_fnc_hashTable_create;

[_came_from,RID(_startRoute),objNull] call misc_fnc_hashTable_set;
[_frontier,_startRoute,0] call misc_fnc_PQ_insert;
[_cost_so_far,RID(_startRoute),0] call misc_fnc_hashTable_set;

while {count _frontier > 0} do {
	private _current = [_frontier] call misc_fnc_PQ_get;

	if (_current isEqualTo _goalRoute) exitWith {};

	{
		_x params ["_next","_cost"];
		_new_cost = ([_cost_so_far,RID(_current)] call misc_fnc_hashTable_find) + _cost;

		if (
			!([_cost_so_far,RID(_next)] call misc_fnc_hashTable_exists) 
		) then {
			[_cost_so_far,RID(_next),_new_cost] call misc_fnc_hashTable_set;
			_priority = _new_cost + (_goalRoute distance _next);
			[_frontier,_next,_priority] call misc_fnc_PQ_insert;
			[_came_from,RID(_next),_current] call misc_fnc_hashTable_set;
		}else{
			if (_new_cost < ([_cost_so_far,RID(_next)] call misc_fnc_hashTable_find)) then {
				[_cost_so_far,RID(_next),_new_cost] call misc_fnc_hashTable_set;
				_priority = _new_cost + (_goalRoute distance _next);
				[_frontier,_next,_priority] call misc_fnc_PQ_insert;
				[_came_from,RID(_next),_current] call misc_fnc_hashTable_set;
			};
		};

	}foreach ([gps_allCrossRoadsWithWeight,RID(_current)] call misc_fnc_hashTable_find);
};

_came_from