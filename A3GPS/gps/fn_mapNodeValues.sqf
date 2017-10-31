#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 23/10/17
	@Description : 
**/
params [
   "_crossRoad",
   "_linkedTo",
   ["_exceptions",[],[[]]]
];

private _linkedCrossRoads = [];
private _linkedSegments = [];
private _previous = _crossRoad;
private _crossRoad_isHighWay = [_crossRoad] call gps_fnc_isHighWay;

{
  private _currRoad = _x;
  private _connected = [_currRoad] call gps_fnc_roadsConnectedTo;
  private _segmentValue = 1;
  private _passedBy = [];
  _previous = _crossRoad;
  _passedBy pushBack _crossRoad;

  // Bohemia , i want my do {} while {};
  while{true} do {
      _connected = [_currRoad] call gps_fnc_roadsConnectedTo;
      _passedBy pushBack _currRoad;
      _segmentValue = _segmentValue + (_previous distance2D _currRoad);

      _currRoad_isHighWay = [_currRoad] call gps_fnc_isHighWay;
      
      if(count _connected isEqualTo 0) exitWith {};
      if(count _connected isEqualTo 1) exitWith {};
      if(count _connected > 2 || _currRoad in _exceptions) exitWith {  
        if(_currRoad_isHighWay && _crossRoad_isHighWay) then {
            _segmentValue = (_segmentValue / 5); 
        };
        if(str _currRoad in gps_data_normalWays && str _crossRoad in gps_data_normalWays) then {
          _segmentValue = (_segmentValue / 1.2); 
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
} forEach _linkedTo;

[gps_roadSegments,parseNumber str _crossRoad,_linkedSegments] call misc_fnc_hashTable_set;
[gps_allCrossRoadsWithWeight,parseNumber str _crossRoad,_linkedCrossRoads] call misc_fnc_hashTable_set;

_linkedCrossRoads