#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : ??
	@Modified : 23/10/17
	@Description : Get Setting from gps config array 
	@Return : Anything
**/

params [
	["_key","",[""]],
	["_default",""]
];

[profileNamespace getVariable "gps_settings",_key,_default] call bis_fnc_getFromPairs;
