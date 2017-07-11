/**
  @Author : [Utopia] Amaury
  @Creation : 1/02/17
  @Modified : 5/02/17
  @Description :trying to make a virtual map because arma road system ...
  				some arrays are useless now , i store the routes data in missionNameSpace in order to have a faster access but i generates +- 37000 vars
**/


scriptName "gps_virtual_mapping";

_start = diag_tickTime;

gps_data_map_center = [worldSize / 2,worldSize / 2,0];

call compile preprocessFileLineNumbers format ["gps\data\%1.sqf",worldName];

gps_allRoads = gps_data_map_center nearRoads (worldSize / 2);
gps_allRoadsWithInter = [];
gps_allCrossRoads = [];
gps_allCrossRoadsWithWeight = [];
gps_onlyCrossRoads = [];
gps_roadSegments = [count gps_allRoads] call misc_fnc_hashTable_create;

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
  
  missionNamespace setVariable [format["gps_connected_%1",str _road],_connected];
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

_fn_mapTheMap = {
  private _crossRoad = _this select 0;
  private _linkedTo = _this select 1;
  private _linkedCrossRoads = [];
  private _linkedSegments = [];
  private _previous = _crossRoad;

  {
      private _currRoad = _x;
      private _connected = [_currRoad] call gps_fnc_roadsConnectedTo;
      private _segmentValue = 1;
      private _passedBy = [];
      _passedBy pushBack _crossRoad;

      if(count _connected > 2) then {  
          if(str _currRoad in gps_data_highWays && str _crossRoad in gps_data_highWays) then {
              _segmentValue = (_segmentValue / 5); 
          };
          if(str _currRoad in gps_data_normalWays && str _crossRoad in gps_data_normalWays) then {
              _segmentValue = (_segmentValue / 2); 
          };
          _linkedCrossRoads pushBack [_currRoad,_segmentValue];
          _linkedSegments pushBack [_currRoad,[]];
      }else{
        while{count _connected <= 2} do {
          _connected = [_currRoad] call gps_fnc_roadsConnectedTo;
          _passedBy pushBack _currRoad;
          _segmentValue = _segmentValue + (_previous distance _currRoad);

          if(count _connected isEqualTo 0) exitWith {};
          if(count _connected isEqualTo 1) exitWith {};
          if(count _connected > 2) exitWith {  
            if(str _currRoad in gps_data_highWays && str _crossRoad in gps_data_highWays) then {
                _segmentValue = (_segmentValue / 5); 
            };
            if(str _currRoad in gps_data_normalWays && str _crossRoad in gps_data_normalWays) then {
              _segmentValue = (_segmentValue / 2); 
            };
            _linkedCrossRoads pushBack [_currRoad,_segmentValue];
            _passedBy deleteAt (count _passedBy - 1);
            _linkedSegments pushBack [_currRoad,_passedBy];
          };
           
          _oldRoad = _currRoad;
          _previous = _oldRoad;
          {
            if(!(_x in _passedBy)) then {
              _currRoad = _x;
            };
          } forEach _connected;

           if(_currRoad isEqualTo _oldRoad) exitWith {};
        };
      };
  } forEach _linkedTo;
  //gps_roadSegments pushBack _linkedSegments;
  [gps_roadSegments,parseNumber str _crossRoad,_linkedSegments] call misc_fnc_hashTable_set;
  _linkedCrossRoads
};


gps_allCrossRoadsWithWeight = gps_allCrossRoads apply {
    _res = _x call _fn_mapTheMap;
    missionNamespace setVariable [format["gps_cross_%1",str (_x select 0)],_res];
    _res
};

systemChat format [["STR_VMAP_INIT_DONE"] call misc_fnc_localize,round (diag_tickTime - _start)];