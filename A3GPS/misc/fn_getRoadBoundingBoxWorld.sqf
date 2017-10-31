params [
	["_road",objNull,[objNull]]
];

private _bb = boundingBox _road;
private _direction = [_road] call misc_fnc_getRoadDir;

_fullbb = [
	_bb select 0,
	[
		(_bb select 1 select 0),
		(_bb select 0 select 1),
		(_bb select 1 select 2)
	],
	_bb select 1,
	[
		(_bb select 0 select 0),
		(_bb select 1 select 1),
		(_bb select 0 select 2)
	]
];

_bbw = _fullbb apply {
	_x set [0,(_x select 0) / 4];
	_x set [1,(_x select 1) * 1.15];
	_road modelToWorld ([_x,-_direction] call BIS_fnc_rotateVector2D)
};

_bbw


// {[nil,_x] call misc_fnc_createMarker}foreach ([roadAt player] call misc_fnc_getRoadBoundingBoxWorld);