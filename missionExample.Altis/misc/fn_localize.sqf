private _key = param [0,"",[""]];
private _default = param [1,"",[""]];
private _lang = param [2,["lang"] call misc_fnc_getSetting,[""]];
private _return = _default;

_cfgEntry = missionConfigFile >> "GPS_Localization" >> _key;

if(isClass _cfgEntry) then {
	_return = getText (_cfgEntry >> _lang);
};

_return