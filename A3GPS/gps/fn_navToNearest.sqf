#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 23/10/17
	@Description : will be removed in the future 
**/

params [
	["_position",[],[objNull,[]]]
];


if (_position isEqualType objNull) then {
	_position = getPosATL _position;
};

_position call gps_fnc_main;