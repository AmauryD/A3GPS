/**
	@Author : [Utopia] Amaury
	@Creation : 12/05/17
	@Modified : 12/05/17
	@Description : 
**/

private _pos1 = _this select 0;
private _dir2 = _this select 2;
private _pos2 = _this select 1;

_dir = _pos1 getDir _pos2;
_dir = _dir - _dir2; //subtract direction of unit

if (_dir < 0) then {_dir = _dir + 360};
if (_dir > 360) then {_dir = _dir - 360};

_dir