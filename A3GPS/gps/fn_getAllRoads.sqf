#include "..\macros.h"
/**
  @Author : [Utopia] Amaury
  @Creation : ??
  @Modified : 23/10/17
  @Description : Load all roads from road file , if file is not found gets all road manually (freeze the game)
  @Return : ARRAY - array of roads
**/

_allRoads = parseSimpleArray loadFile ([format["gps\data\%1\AllRoads.sqf",worldName]] call gps_fnc_composeFilePath);

if (isNil "_allRoads") exitWith {
	[format["Error : no road data found for world %1 , getting roads manually , this might freeze the game.",worldName],"FATAL ERROR"] call bis_fnc_guiMessage;
	[worldSize / 2,worldSize / 2,0] nearRoads worldSize;
};

// return all roads
_allRoads apply {
	_road = (_x nearRoads 0.1) param [0,objNull];
	if (isNull _road) then {
		[_x,10] call bis_fnc_nearestROad;
	}else{
		_road;
	};	
};