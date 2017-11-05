#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : ??/11/17
	@Modified : --
	@Description : select an element of an array , throwing an error that can be handled if the index is not correct
		Return : Anything
**/


_valid = params [
	["_array",[],[[]]],
	["_index",-1,[0]]
];

if (!_valid) then {
	throw "INVALID_PARAMETERS";
};

if(_index > (count _array - 1)) then {
	throw "OUT_OF_BOUNDS";
};

_array select _index