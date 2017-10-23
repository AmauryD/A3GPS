#include "..\macros.h"
/**
  @Author : [Utopia] Amaury
  @Creation : ??
  @Modified : 23/10/17
  @Description : insert fake node on the path
  TODO : delete fake nodes later
**/
params [
	["_road",objNull,[objNull]]
];

gps_onlyCrossRoads pushBackUnique _road;

_res = [_road,[_road] call gps_fnc_roadsConnectedTo,gps_onlyCrossRoads] call gps_fnc_mapNodeValues;

{
	[_x select 0,[_x select 0] call gps_fnc_roadsConnectedTo,gps_onlyCrossRoads] call gps_fnc_mapNodeValues;
}foreach _res;
