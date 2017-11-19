#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 12/05/17
	@Modified : 18/06/17
	@Description : Extract farest pos from array of objects and/or positions
		Return : Object,Array
**/

params [
	["_point",objNull,[objNull,[]]],
	["_searchArray",[],[[]]]
];

private _nearest = _point;

{
	if(_x distance _point > _nearest distance _point) then {
		_nearest = _x;
	};
}forEach _searchArray;

_nearest