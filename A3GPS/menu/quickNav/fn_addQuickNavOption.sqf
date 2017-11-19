_valid = params [
	["_text","",[""]],
	["_code",{},[{},""]]
];

if (!_valid) exitWith {
	["Invalid parameters"] call gps_fnc_log;
	false
};

if(isNil "gps_quickNav_options") then {
	gps_quickNav_options = [];
};

if(_code isEqualType "") then {
	_code = compile _code;
};

(gps_quickNav_options pushBackUnique [_text,_code]) != -1