#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : ??
	@Modified : 23/10/17
	@Description : 
**/

params [
	["_key","",[""]]
];

[profileNamespace getVariable "gps_settings",_key] call bis_fnc_getFromPairs;