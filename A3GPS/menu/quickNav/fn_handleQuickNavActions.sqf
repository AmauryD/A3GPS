#include "..\..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 20/10/17
	@Modified : 23/10/17
	@Description : nothing to say
**/
disableSerialization;

params ["","_key","_shift","_ctrl","_alt"];

_handled = false;

_hudDisplay = uiNamespace getVariable ["gps_quickNav",displayNull];

if(dialog) exitWith {_handled};

_handled = switch(_key) do {
	case 15: {
		call gps_menu_fnc_quickNavCreate
	};
	case 54: {
		call gps_menu_fnc_quickNavNextOption
	};
	case 28: {
		call gps_menu_fnc_quickNavExecuteCurrentOption
	};
	default	{
		false
	};
};

_handled