#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 12/05/17
	@Modified : 23/10/17
	@Description : Make the average angle from multiple angles (maybe a better method exists ?)
		Return : Number
**/
params [
	["_angles",[],[[]]]
];

if(count _angles == 0) exitWith	{0};
if(count _angles == 1) exitWith	{_angles select 0};

private _average = (sin (_angles select 0) + sin (_angles select 1)) atan2 (cos (_angles select 0) + cos (_angles select 1));

{
	_average = (sin _average + sin _x) atan2 (cos _average + cos _x);
}foreach _angles;

if (_average < 0) then {_average = _average + 360};
if (_average > 360) then {_average = _average - 360};

_average	