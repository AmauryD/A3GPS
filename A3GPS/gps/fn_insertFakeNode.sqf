private _road = param [0,objNull,[objNull]];

gps_onlyCrossRoads pushBackUnique _road;

_res = [_road,[_road] call gps_fnc_roadsConnectedTo,gps_onlyCrossRoads] call gps_fnc_mapNodeValues;

{
	[_x select 0,[_x select 0] call gps_fnc_roadsConnectedTo,gps_onlyCrossRoads] call gps_fnc_mapNodeValues;
}foreach _res;
