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

_highways = call compile preprocessFileLineNumbers format [gps_dir + "gps\data\%1\Highways.sqf",_worldName];
_normalRoads = call compile preprocessFileLineNumbers format [gps_dir + "gps\data\%1\NormalRoads.sqf",_worldName];

if(isNil "_highways") then {
	[format["WARNING : highways roads data not found for world %1",_worldName]] call gps_fnc_log;
	_highways = [];
};

if(isNil "_normalRoads") then {
	[format["WARNING : normal roads data not found for world %1",_worldName]] call gps_fnc_log;
	_normalRoads = [];
};

gps_data_highWays = _highways;
gps_data_normalWays = _normalRoads;