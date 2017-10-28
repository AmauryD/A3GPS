params [
	["_key","",["",configNull]]
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
		nil 
	};
};

_return