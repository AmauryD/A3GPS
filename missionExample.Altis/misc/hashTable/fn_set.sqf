/**
	@Author : [Utopia] Amaury
	@Creation : 12/05/17
	@Modified : 12/05/17
	@Description : --
**/


private _array = _this select 0;
private _key = _this select 1;
private _val = _this select 2;

_id = (_key % count _array);

_array set [_id,_val]
