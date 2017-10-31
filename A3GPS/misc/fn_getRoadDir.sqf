params [
	["_road",objNull,[objNull]]
];

private _connectedRoads = roadsConnectedTo _road;
private _direction = 0;

if(count _connectedRoads == 0) exitWith {_direction};

if(count _connectedRoads == 1) then 
{
	_direction = _road getDir (_connectedRoads select 0);
}else{
	_direction = (_connectedRoads select 0) getDir (_connectedRoads select 1);
};

_direction