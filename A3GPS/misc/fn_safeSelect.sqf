_valid = params [
	["_array",[],[[]]],
	["_index",-1,[0]]
];

if (!_valid) then {
	throw "INVALID_PARAMETERS";
};

if((count _array - 1) > _index) then {
	throw "OUT_OF_BOUNDS";
};

_array select _index