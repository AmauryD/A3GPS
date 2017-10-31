params [
	["_recPos1",[0,0,0],[[]]],
	["_recPos2",[0,0,0],[[]]]
];

private _return = false;

{
	if(_x inPolygon _recPos2) exitWith {
		_return = true;
	};
}foreach _recPos1;

_return