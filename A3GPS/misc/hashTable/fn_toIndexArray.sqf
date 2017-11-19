#include "..\..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 19/11/17
	@Modified : 19/11/17
	@Description : --
**/
params ["_array"];

private _return = [];

{
	if (!isNil "_x") then {
		_return pushBack [_forEachIndex,_x];
	};
}foreach _array;

_return