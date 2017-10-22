params [
	["_path","",[""]],
	["_fileName","",[""]],
	["_disableHeader",false,[true]]
];

_fileName = format["%1.sqf",_fileName];

_header = ([format["private _thisFile = '%1';",_fileName],""]) select _disableHeader;

compileFinal format["%1%2",
	_header,
	preprocessFileLineNumbers format["%1\%2",gps_dir + _path,_fileName]
];