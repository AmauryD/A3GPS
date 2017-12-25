#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : ??/10/17
	@Modified : --
	@Description : get the road direction
		Return : Number
**/

params [
	["_road",objNull,[objNull]],
	["_otherRoad",objNull,[objNull]]
];

private _direction = 0;

if(isNull _otherRoad) then {
	private _connectedRoads = roadsConnectedTo _road;

	if(count _connectedRoads == 0) exitWith {_direction};

	if(count _connectedRoads >= 1) then 
	{
		_roadID = parseNumber str _road;
		private _friendlyRoads = _connectedRoads select {(parseNumber str _x) in [_roadID + 1,_roadID - 1]};
		if (_friendlyRoads isEqualTo []) then {
			_friendlyRoads = _connectedRoads;
		};
		_direction = _road getDir (_friendlyRoads select 0);
	};
}else{
	_direction = _road getDir _otherRoad;
};

_direction