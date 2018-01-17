#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 04/11/17
	@Modified : --
	@Description : converts meters to kilometers
	@Return : STRING
**/

params [
	["_meters",0,["",0]],
	["_decimals",1,[0]]
];

if(_meters isEqualType "") then {
	_meters = parseNumber _meters;
};

(_meters / 1000) toFixed _decimals