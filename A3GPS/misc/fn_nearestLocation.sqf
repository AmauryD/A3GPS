#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 4/02/17
	@Description : finds the nearest location near point/object.
	@Return : LOCATION - nearest location 
**/

params [
	["_position",objNull,[[],objNull]],
	["_radius",1000,[0]],
	["_types",["NameCity","NameVillage","NameCityCapital","NameLocal"],[[]]]
];

_locations = nearestLocations [_position, _types, _radius];

if (_locations isEqualTo []) exitWith {locationNull};

// return nearest location
[_locations,_position] call bis_fnc_nearestPosition