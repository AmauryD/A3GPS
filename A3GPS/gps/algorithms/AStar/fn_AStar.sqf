#include "..\..\..\macros.h"

params ["_startRoute","_goalRoute","_namespace"];

private _frontier = [];
private _counter = 0;
private _current = [];

private _came_from = [] call misc_fnc_hashTable_create;
private _cost_so_far = [] call misc_fnc_hashTable_create;

[_came_from,RID(_startRoute),objNull] call misc_fnc_hashTable_set;
[_frontier,0,_counter,_startRoute] call misc_fnc_PQ_insert;
[_cost_so_far,RID(_startRoute),0] call misc_fnc_hashTable_set;

while {count _frontier > 0} do {
	// get road with lowest value in queue
	_current = [_frontier] call misc_fnc_PQ_get;

	if (_current isEqualTo _goalRoute) exitWith {};

	{
		_x params ["_next","_cost"];
		_new_cost = ([_cost_so_far,RID(_current)] call misc_fnc_hashTable_find) + _cost;
		if (
			!([_cost_so_far,RID(_next)] call misc_fnc_hashTable_exists) 
		) then {
			_counter = _counter + 1;
			[_cost_so_far,RID(_next),_new_cost] call misc_fnc_hashTable_set;
			_priority = _new_cost + (_goalRoute distance _next);
			[_frontier,_priority,_counter,_next] call misc_fnc_PQ_insert;
			[_came_from,RID(_next),_current] call misc_fnc_hashTable_set;
		}else{
			if (_new_cost < ([_cost_so_far,RID(_next)] call misc_fnc_hashTable_find)) then {
				_counter = _counter + 1;
				[_cost_so_far,RID(_next),_new_cost] call misc_fnc_hashTable_set;
				_priority = _new_cost + (_goalRoute distance _next);
				[_frontier,_priority,_counter,_next] call misc_fnc_PQ_insert;
				[_came_from,RID(_next),_current] call misc_fnc_hashTable_set;
			};
		};
	}foreach ([_namespace,RID(_current)] call misc_fnc_hashTable_find);
};

_came_from