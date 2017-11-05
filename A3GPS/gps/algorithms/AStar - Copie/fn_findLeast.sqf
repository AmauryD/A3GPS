#include "..\..\..\macros.h"


#define GET_NODE(ROAD_NAME) [_nameSpace,parseNumber ROAD_NAME] call misc_fnc_hashTable_find

private "_return";
private _open_list = _this;
private _least = 9*9999999999;

{
	_node = GET_NODE(_x);
	_f = _node select 2;
	if(_f < _least) then {
		_least = _f;
		_return = _x;
	};
}foreach _open_list;

_return