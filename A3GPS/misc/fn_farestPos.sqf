/**
	@Author : [Utopia] Amaury
	@Creation : 12/05/17
	@Modified : 18/06/17
	@Description : 
**/

private _point = param [0,[0,0,0],[objNull,[]]]; // can input pos or objects
private _searchArray = param [1,[],[[]]];
private _nearest = _point;

{
	if(_x distance _point > _nearest distance _point) then {
		_nearest = _x;
	};
}forEach _searchArray;

_nearest