#include "..\..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 12/05/17
	@Modified : 23/10/17
	@Description : --
**/
params ["_array","_key","_val"];

_id = (_key % count _array);

if(isNil "_val") exitWith {
	_array set [_id,nil];
};

_array set [_id,_val]