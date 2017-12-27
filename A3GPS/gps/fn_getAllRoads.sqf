#include "..\macros.h"
/**
  @Author : [Utopia] Amaury
  @Creation : ??
  @Modified : 23/10/17
**/

_allRoads = parseSimpleArray loadFile ([format["gps\data\%1\AllRoads.sqf",worldName]] call gps_fnc_composeFilePath);

if (isNil "_allRoads") exitWith {
	[format["Error : no road data found for world %1 , getting roads manually , this might freeze the game.",worldName],"FATAL ERROR"] call bis_fnc_guiMessage;
	[worldSize / 2,worldSize / 2,0] nearRoads worldSize;
};

_allRoads apply {
	[_x,5] call bis_fnc_nearestRoad;
};