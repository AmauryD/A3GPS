/**
	@Author : [Utopia] Amaury
	@Creation : 8/05/17
	@Modified : --
	@Description : nothing to say
**/

private _pos = param[0,[0,0,0],[[]]];
private _radius = param [1,10,[0]];

private _nearest = _radius;
private _return = objNull;

{
	if(_pos distance _x < _nearest) then {
		_nearest = _pos distance _x;
		_return = _x;
	};
}foreach (_pos nearRoads _radius);

_return