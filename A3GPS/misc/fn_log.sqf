params ["_anything"];

diag_log format	["[%1] GPS (%3): %2",
	diag_tickTime,
	_anything,
	if(isNil "_thisFile") then {
		"Unknown file"
	}else{
		_thisFile
	}
];