#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 8/05/17
	@Modified : --
	@Description : nothing to say
		Return : Array,Object 
**/
params [
	["_pos",[],[[]]],
	["_radius",10,[0]],
	["_array",[],[[]]]
];

private _nearest = _radius;
private _return = objNull;

{
	if(_x in _array) then {
		if(_pos distance _x < _nearest) then {
			_nearest = _pos distance _x;
			_return = _x;
		};
	};
}foreach (_pos nearRoads _radius);

_return