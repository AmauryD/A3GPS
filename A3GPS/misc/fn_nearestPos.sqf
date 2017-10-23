#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 4/02/17
	@Description : finds the nearest object/pos from a lot of positions or objects
**/
params [
	["_point",objNull,[objNull,[]]],
	["_searchArray",[],[[]]]
];
private _nearest = [999999,99999999,9999999];

{
	if(_x distance _point < _nearest distance _point) then {
		_nearest = _x;
	};
}forEach _searchArray;

_nearest