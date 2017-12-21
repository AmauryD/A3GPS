#include "..\macros.h"
/**
  @Author : [Utopia] Amaury
  @Creation : ??
  @Modified : 23/10/17
**/

_allRoads = call compile loadFile format ["%1gps\data\%2\AllRoads.sqf",gps_dir,worldName];

if (isNil "_allRoads") exitWith {[]};

_allRoads apply {
	[_x,10] call bis_fnc_nearestRoad;
};