#include "..\..\..\macros.h"
/**
	@Author : 
		[Utopia] Amaury
	@Contributors :
		Code34
	@Creation : --
	@Modified : --
	@Description : 
		AStar algorithm
		http://theory.stanford.edu/~amitp/GameProgramming/ImplementationNotes.html
		https://en.wikipedia.org/wiki/A*_search_algorithm
		http://theory.stanford.edu/~amitp/GameProgramming/AStarComparison.html
		https://www.redblobgames.com/pathfinding/a-star/introduction.html
	@Return : OBJECT - hashTable
**/

params [
	"_startRoute",
	"_goalRoute",
	"_namespace",
	["_weightFunction",{_goalRoute distance _next}]
];

private _frontier = [];
private _counter = 0;
private _current = [];

private _came_from = [] call misc_fnc_hashTable_create;
private _cost_so_far = [] call misc_fnc_hashTable_create;

[_came_from,RID(_startRoute),objNull] call misc_fnc_hashTable_set;
[_frontier,0,_counter,_startRoute] call misc_fnc_PQ_insert;
[_cost_so_far,RID(_startRoute),0] call misc_fnc_hashTable_set;

for "_i" from 0 to 1 step 0 do {
	// check if frontier is empty
	if (_frontier isEqualTo []) exitWith {};

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
			_priority = _new_cost + (call _weightFunction);
			[_frontier,_priority,_counter,_next] call misc_fnc_PQ_insert;
			[_came_from,RID(_next),_current] call misc_fnc_hashTable_set;
		}else{
			if (_new_cost < ([_cost_so_far,RID(_next)] call misc_fnc_hashTable_find)) then {
				_counter = _counter + 1;
				[_cost_so_far,RID(_next),_new_cost] call misc_fnc_hashTable_set;
				_priority = _new_cost + (call _weightFunction);
				[_frontier,_priority,_counter,_next] call misc_fnc_PQ_insert;
				[_came_from,RID(_next),_current] call misc_fnc_hashTable_set;
			};
		};
	}foreach ([_namespace,RID(_current)] call misc_fnc_hashTable_find);
};

_came_from