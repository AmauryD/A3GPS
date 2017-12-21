#include "..\macros.h"
/**
  @Author : [Utopia] Amaury
  @Creation : ??
  @Modified : 23/10/17
**/

_allRoads = call compile loadFile ([format["gps\data\%1\AllRoads.sqf",worldName]] call gps_fnc_composeFilePath);

if (isNil "_allRoads") exitWith {[]};

_allRoads apply {
	[_x,10] call bis_fnc_nearestRoad;
};