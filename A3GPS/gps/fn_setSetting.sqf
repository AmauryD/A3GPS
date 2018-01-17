#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 12/05/17
	@Modified : 23/10/17
	@Description : Set a gps setting value to the gps_settings global array
	@Return : Nothing ?
**/

params [
	["_key","",[""]],
	"_val"
];

[profileNamespace getVariable "gps_settings",_key,_val] call bis_fnc_setToPairs;