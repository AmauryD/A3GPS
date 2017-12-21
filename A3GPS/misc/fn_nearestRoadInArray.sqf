/*
	Author: Nelson Duarte, optimised by Killzone_Kid

	Description:
	Find the nearest road segment to certain position, within given radius

	Parameter(s):
	_this select 0:	ARRAY	- The center position
	_this select 1:	NUMBER	- The distance from center position
	_this select 2:	ARRAY	- List of WHITELISTED road objects
	
	Returns:
	OBJECT	- Nearest road object on success
	NULL	- If no road object is found within given radius
*/

params [["_pos",[0,0,0]],["_rad",50],["_list",[]],"_dist"];

private _roads = (_pos nearRoads _rad) select {_x in _list};
private _max = -log 0;
private _nearest = objNull;

{
	_dist = _x distanceSqr _pos;
	if (_dist < _max) then {_max = _dist; _nearest = _x};
} 
count _roads;

_nearest