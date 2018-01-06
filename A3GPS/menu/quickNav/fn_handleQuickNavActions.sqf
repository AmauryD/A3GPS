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

if(dialog) exitWith {_handled};

_handled = switch(_key) do {
	case (["quicknav_open_key"] call misc_fnc_getSetting): {
		call gps_menu_fnc_quickNavCreate
	};
	case (["quicknav_switch_key"] call misc_fnc_getSetting): {
		call gps_menu_fnc_quickNavNextOption
	};
	case (["quicknav_execute_key"] call misc_fnc_getSetting): {
		call gps_menu_fnc_quickNavExecuteCurrentOption
	};
	default	{
		false
	};
};

_handled