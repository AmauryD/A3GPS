#include "..\..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 20/07/17
	@Modified : 23/10/17
	@Description : nothing to say
**/
params ["_disp"];

uiNamespace setVariable ['gps_quickNav', _disp];

_btn = _disp displayCtrl 1600;
_btn ctrlEnable false;
_text = _disp displayCtrl 1100;

_text ctrlSetStructuredText parseText format["<t align='center'>%1</t>",["STR_QUICKNAV_HEADER"] call gps_fnc_localize];

_options = missionNamespace getVariable ["gps_quickNav_options",[]];

if(!(missionNamespace getVariable ["gps_core_init_done",false])) exitWith {
	_btn ctrlSetText "Loading ...";
};

_disp setVariable ["options",_options];
_disp setVariable ["selOpt",0];

if(_options isEqualTo []) then {
	_btn ctrlSetText "< Empty >";
}else{
	_btn ctrlSetText ((_options select 0) select 0);
};
	

{	//hide the elements
	_pos = ctrlPosition _x;
	_x setVariable ["originalPos",_pos];
	_x ctrlSetPosition [_pos select 0,_pos select 1,0,_pos select 3];
	_x ctrlCommit 0;
}foreach allControls _disp;

