#include "..\macros.h"
/**
  @Author : [Utopia] Amaury
  @Creation : 22/02/17
  @Modified : 22/10/17
  @Description : function/procedure in order to have cleaner code in fn_mapRoutes
**/

params [
	["_worldName",worldName,[""]]
];

_normalRoads = call compile preprocessFileLineNumbers format [gps_dir + "gps\data\%1\NormalRoads.sqf",_worldName];

if(isNil "_normalRoads") then {
	[format["WARNING : normal roads data not found for world %1",_worldName]] call gps_fnc_log;
	_normalRoads = [];
};

gps_data_normalWays = _normalRoads;