#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : ??
	@Modified : 23/10/17
	@Description : Localize from gps locale file
	@Return : String 
**/
params [
	["_key","",[""]],
	["_lang",["lang"] call gps_fnc_getSetting,[""]]
];

private _return = _key;
private _cfgEntry = missionConfigFile >> "GPS_Localization" >> _key;

if(isClass _cfgEntry) then {
	_return = getText (_cfgEntry >> _lang);
};

_return