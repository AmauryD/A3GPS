/**
	@Author : [Utopia] Amaury
	@Creation : 17/05/17
	@Modified : 17/06/17
	@Description : nothing to say
**/

_disp = _this select 0;
uiNamespace setVariable ['gps_hud', _disp];

_map = _disp displayCtrl 2200;
_text = _disp displayCtrl 1000;
_header_dir = _disp displayCtrl 1101;
_header_grid = _disp displayCtrl 1102;
_header_time = _disp displayCtrl 1103;
_backGround = _disp displayCtrl 2201;

{	//hide the elements
	_pos = ctrlPosition _x;
	_x setVariable ["originalPos",_pos];
	_x ctrlSetPosition [_pos select 0,_pos select 1,0,_pos select 3];
	_x ctrlCommit 0;
}foreach [_map,_text,_backGround,_header_dir,_header_time,_header_grid];
