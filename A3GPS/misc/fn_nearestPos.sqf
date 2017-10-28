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
private _return = [[0,0,0],objNull] select (_point isEqualType objNull);

{
	if(_x distance _point < _return distance _point) then {
		_return = _x;
	};
}forEach _searchArray;

_return