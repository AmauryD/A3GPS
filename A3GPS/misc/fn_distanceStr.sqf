#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 04/11/17
	@Modified : --
	@Description : converts meters to kilometers
	@Return : STRING
**/

params [
	["_distance",0,["",0]],
	["_decimals",1,[0]],
	["_metricSystem","km"]
];

_metricUnit = "m";

if (_metricSystem == "mi") then {
	if (_distance * 0.6213712 > 1000) then {
		_distance = (_distance * 0.6213712) / 1000;
		_metricUnit = "mi";
	};
}else{
	if (_distance > 1000) then {
		_distance = _distance / 1000;
		_metricUnit = "km";
	};
};



format ["%1 %2",_distance toFixed _decimals,_metricUnit]