#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : ??
	@Modified : 23/10/17
	@Description : 
**/
scriptName "gps_wait_arrive";

private _handle = param [0,scriptNull,[scriptNull]];
private _end = param [1,objNull,[objNull]];

waitUntil {uisleep 1;!(_handle isEqualTo gps_curr_thread) || player distance _end < 10}; // wait for new search or player arrives at destination
if(player distance _end < 10) then {
	[] call gps_fnc_deletePathHelpers;
	hintSilent (["STR_ARRIVED"] call misc_fnc_localize);
};
terminate _handle;
[] call gps_menu_fnc_closeHud;