#include "..\macros.h"
/**
  @Author : [Utopia] Amaury
  @Creation : ??
  @Modified : 23/10/17
  @Description : get all roads on the map , need to improve 
**/

// i was trying to do things smoothly but finaly it does not freeze the screen
//[worldSize / 2,worldSize / 2,0] nearRoads worldSize;


_allRoads = [];
_divisor = 10;
_multiplicator = (worldSize / _divisor);

for "_yA" from 0 to _divisor do {
	for "_xA" from 0 to _divisor do {
		_pos = [_xA * _multiplicator,_yA * _multiplicator,0];
		_allRoads append (_pos nearRoads (_multiplicator * 1.5));
	};
};

_return = [];

{
	_return set [parseNumber str _x,_x];
}foreach _allRoads;

_delete = [];
{
	if !(isNil "_x") then {
		_delete pushBack _x;
	};
}forEach _return;

_delete
