#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 4/02/17
	@Description : finds the nearest object/pos from a lot of positions or objects .
		Return : Array,Object - Element of the _searchArray
**/
params [
	["_point",objNull,[objNull,[]]],
	["_searchArray",[],[[]]]
];


// 5ms +-190 cycles on huge array
private _return = [[0,0,0],objNull] select (_point isEqualType objNull);

{
	if(_x distance _point < _return distance _point) then {
		_return = _x;
	};
}forEach _searchArray;

_return

/*
// 6ms +-150 cycles on huge array , almost the same
_mappedDistances = _searchArray apply {
	[_x distance _point,_x]
};

_mappedDistances sort true;
_mappedDistances select 0 select 1
*/