private _road = param [0,objNull,[objNull]];

_res = [_road,[_road] call gps_fnc_roadsConnectedTo,[_road]] call gps_fnc_mapNodeValues;

{
	[_x select 0,[_x select 0] call gps_fnc_roadsConnectedTo,[_road]] call gps_fnc_mapNodeValues;
}foreach _res;
