#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : ??/11/17
	@Modified : --
	@Description : insert an array of elements into another array at a specific index
		Return : Array 
**/

params ["_array","_element","_index"];

(_array select [0,_index]) + [_element] + (_array select [_index,(count _array) - _index])