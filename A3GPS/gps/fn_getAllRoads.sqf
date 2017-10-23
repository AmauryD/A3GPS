#include "..\macros.h"
/**
  @Author : [Utopia] Amaury
  @Creation : ??
  @Modified : 23/10/17
  @Description : get all roads on the map , need to improve 
**/

private _startPos = [500,500,0];
_allRoads = [];
_divisor = (worldSize / 1000);

for "_yA" from 0 to _divisor do {
	for "_xA" from 0 to _divisor do {
		_pos = [_xA * 1000,_yA * 1000,0];
		_allRoads append (_pos nearRoads 750);
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