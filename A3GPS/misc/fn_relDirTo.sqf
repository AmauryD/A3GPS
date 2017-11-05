#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 12/05/17
	@Modified : 12/05/17
	@Description : remove later ? 
**/
params ["_pos1","_dir2","_pos2"];

_dir = _pos1 getDir _pos2;
_dir = _dir - _dir2; //subtract direction of unit

if (_dir < 0) then {_dir = _dir + 360};
if (_dir > 360) then {_dir = _dir - 360};

_dir