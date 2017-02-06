/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 4/02/17
	@Description : finds the nearest object/pos from a lot of positions or objects
**/

private _point = param [0,[0,0,0],[objNull,[]]]; // can input pos or objects
private _searchArray = param [1,[],[[]]];
private _nearest = [999999,99999999,9999999];

{
	if(_x distance _point < _nearest distance _point) then {
		_nearest = _x;
	};
}forEach _searchArray;

_nearest