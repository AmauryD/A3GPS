/**
  @Author : [Utopia] Amaury
  @Creation : 1/02/17
  @Modified : 5/02/17
  @Description :trying to make a virtual map because arma road system ...
  				this file has changed so much ...
**/


scriptName "gps_virtual_mapping";

gps_data_map_center = [worldSize / 2,worldSize / 2,0];

call compile preprocessFileLineNumbers format ["gps\data\%1.sqf",worldName];

_start = diag_tickTime;
gps_allRoads = [] call gps_fnc_getAllRoads;

_max_road_index = (gps_allRoads apply {parseNumber str _x});
_max_road_index sort false;
gps_max_road_index = _max_road_index select 0;

gps_allRoadsWithInter = [];
gps_allCrossRoads = [];
gps_allCrossRoadsWithWeight = [gps_max_road_index] call misc_fnc_hashTable_create;
gps_onlyCrossRoads = [];
gps_roadSegments = [gps_max_road_index] call misc_fnc_hashTable_create;
gps_roadsWithConnected =  [gps_max_road_index] call misc_fnc_hashTable_create;

gps_alreadyLinked = [];

gps_allRoadsWithInter = gps_allRoads apply {
  private _road = _x;
  private _near = getPosATL _road nearRoads 17;
  private _connected = roadsConnectedTo _road;

  {
     if !(_x in _connected) then {
        if(count roadsConnectedTo _x isEqualTo 1) then {
          _connected pushBackUnique _x;
        };
     };
  }foreach _near;
  
  [gps_roadsWithConnected,parseNumber str _road,_connected] call misc_fnc_hashTable_set;
  [_road,_connected]
};

{
  _fn_isCrossRoad = {
  		_nbr = {_x in gps_allCrossRoads}count _this;
  		_nbr > 0
  };
  if(count (_x select 1) > 2 && !(_x call _fn_isCrossRoad)) then {gps_allCrossRoads pushBack _x}
} forEach gps_allRoadsWithInter;

gps_onlyCrossRoads = gps_allCrossRoads apply {_x select 0};

{
    _x call gps_fnc_mapNodeValues;
}foreach gps_allCrossRoads;

systemChat format [["STR_VMAP_INIT_DONE"] call misc_fnc_localize,round (diag_tickTime - _start)];