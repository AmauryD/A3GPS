#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 17/05/17
	@Modified : 23/10/17
	@Description : nothing to say
**/
params ["_disp"];

uiNamespace setVariable ['gps_hud', _disp];

{	//hide the elements
	_pos = ctrlPosition _x;
	_x setVariable ["originalPos",_pos];
	_x ctrlSetPosition [_pos select 0,_pos select 1,0,_pos select 3];
	_x ctrlCommit 0;
}foreach allControls _disp;
