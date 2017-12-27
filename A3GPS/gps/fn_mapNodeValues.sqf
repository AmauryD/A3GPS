#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 23/10/17
	@Description : 
  TODO : Need to improve this file
**/
params [
   "_crossRoad",
   "_linkedTo",
   ["_exceptions",[],[[]]]
];

private _linkedCrossRoads = [];
private _crossRoad_isHighWay = [_crossRoad] call gps_fnc_isHighWay;

{
  private _currRoad = _x;
  private _segmentValue = 0;
  private _previous = _crossRoad;

  // faster than while {true}
  for "_i" from 0 to 1 step 0 do {
    _connected = [_currRoad] call gps_fnc_roadsConnectedTo;
    _countConnected = count _connected;
    _segmentValue = _segmentValue + (_previous distance2D _currRoad);

    _currRoad_isHighWay = [_currRoad] call gps_fnc_isHighWay;

    if(_countConnected < 2) exitWith {};
    if(_countConnected > 2 || _currRoad in _exceptions) exitWith {  
      if(_currRoad_isHighWay && _crossRoad_isHighWay) then {
        _segmentValue = (_segmentValue / 3); 
      };
      _linkedCrossRoads pushBack [_currRoad,_segmentValue];
    };

    _old = _currRoad;

    {
      if !(_x isEqualTo _previous) exitWith {
        _previous = _currRoad;
        _currRoad = _x;
      };
    } forEach _connected;

    if(_currRoad isEqualTo _old) exitWith {};
  };
} forEach _linkedTo;

//[gps_roadSegments,str _crossRoad,_linkedSegments] call misc_fnc_hashTable_set;
[gps_allCrossRoadsWithWeight,str _crossRoad,_linkedCrossRoads] call misc_fnc_hashTable_set;

_linkedCrossRoads