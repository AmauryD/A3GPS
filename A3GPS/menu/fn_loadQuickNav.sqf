/**
	@Author : [Utopia] Amaury
	@Creation : 20/07/17
	@Modified : 20/07/17
	@Description : nothing to say
**/

_disp = _this select 0;
uiNamespace setVariable ['gps_quickNav', _disp];

_btn = _disp displayCtrl 1600;
_text = _disp displayCtrl 1100;

_options = [["< Service Station >","['Land_fs_feed_F'] spawn gps_fnc_navToNearest"],["< Patate Station >","systemChat 'ok';"]];

_disp setVariable ["options",_options];
_disp setVariable ["selOpt",0];

_btn buttonSetAction ((_options select 0) select 1);
_btn ctrlSetText ((_options select 0) select 0);

{	//hide the elements
	_pos = ctrlPosition _x;
	_x setVariable ["originalPos",_pos];
	_x ctrlSetPosition [_pos select 0,_pos select 1,0,_pos select 3];
	_x ctrlCommit 0;
}foreach [_btn,_text];

