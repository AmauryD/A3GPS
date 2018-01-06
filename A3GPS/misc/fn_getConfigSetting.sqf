#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : ??/10/17
	@Modified : --
	@Description : Get a config entry in gps (move to gps folder ?) , returning the value dynamically
		Return : Anything - Config entry type
**/

params [
	["_key","",["",configNull]],
	["_default",nil]
];

private _mainConfig = missionConfigFile >> "CfgGPS"; // static 
private _path = _mainConfig >> _key;
private _return = switch(true) do {
	case (isNumber _path): {
		getNumber _path
	};
	case (isArray _path): {
		getArray _path
	};
	case (isText _path): {
		getText _path
	};
	default {
		_default 
	};
};

_return