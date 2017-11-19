/*
	Inspired from https://forums.bistudio.com/forums/topic/175210-get-road-type/?tab=comments#comment-3224716
*/

#define HIGHWAY_DIAMETER 12 //dertermined with : https://forums.bistudio.com/forums/topic/175210-get-road-type/?tab=comments#comment-3224716

params [["_road", objNull, [objNull]]];

private _connectedRoads = roadsConnectedTo _road;

private _numConnectedRoads = count _connectedRoads;
if (_numConnectedRoads == 0) exitWith {false}; //Connected road not found, can't calculate direction

private _direction = [_road] call misc_fnc_getRoadDir;

private _roadPos = getPosATl _road;

//Get orthogonal direction
private _cos = cos (_direction+90);
private _sin = sin (_direction+90);
private _vectorDir = [_sin, _cos, 0];

//Find road width in one direction
private _checkPos = _roadPos;
private _testWidth = HIGHWAY_DIAMETER / 2;
private _width = 0;

_pos1 = _roadPos vectorAdd (_vectorDir vectorMultiply _testWidth);
_vectorDir = [-_sin, -_cos, 0];
_pos2 = _roadPos vectorAdd (_vectorDir vectorMultiply _testWidth);

isOnRoad _pos1 && isOnRoad _pos2