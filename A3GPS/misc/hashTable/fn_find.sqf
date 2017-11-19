#include "..\..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 12/05/17
	@Modified : 23/10/17
	@Description : --
**/
params ["_array","_key"];

_id = (_key % count _array);

_array select _id