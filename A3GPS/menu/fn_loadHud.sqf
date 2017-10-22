/**
	@Author : [Utopia] Amaury
	@Creation : 17/05/17
	@Modified : 17/06/17
	@Description : nothing to say
**/

_disp = _this select 0;
uiNamespace setVariable ['gps_hud', _disp];

{	//hide the elements
	_pos = ctrlPosition _x;
	_x setVariable ["originalPos",_pos];
	_x ctrlSetPosition [_pos select 0,_pos select 1,0,_pos select 3];
	_x ctrlCommit 0;
}foreach allControls _disp;
