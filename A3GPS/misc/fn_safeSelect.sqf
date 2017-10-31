_valid = params [
	["_array",[],[[]]],
	["_index",-1,[0]]
];

if (!_valid) then {
	throw "INVALID_PARAMETERS";
};

if(_index > (count _array - 1)) then {
	throw "OUT_OF_BOUNDS";
};

_array select _index