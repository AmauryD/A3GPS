#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : ??/10/17
	@Modified : --
	@Description : Get a config entry in gps (move to gps folder ?) , returning the value dynamically
	@Return : Anything - Config entry type
**/

params [
	["_key","",["",configNull]],
	["_default",nil]
];

private _configEntry = missionConfigFile >> "CfgGPS" >> _key; // static 

switch(true) do {
	case (isNumber _configEntry): {
		getNumber _configEntry
	};
	case (isArray _configEntry): {
		getArray _configEntry
	};
	case (isText _configEntry): {
		getText _configEntry
	};
	default {
		_default 
	};
};