#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 4/02/17
	@Description : finds the nearest location near point/object.
**/

params [
	["_position",objNull,[[],objNull]],
	["_radius",1000,[0]],
	["_types",["NameCity","NameVillage","NameCityCapital","NameLocal"],[[]]]
];

_locations = nearestLocations [_position, _types, _radius];
_posArray = _locations apply {locationPosition _x};
_nearest = [_position,_posArray] call misc_fnc_nearestPos;
_result = _locations select (_posArray find _nearest);

if(isNil "_result") then {
	locationNull
}else{
	_result
};
