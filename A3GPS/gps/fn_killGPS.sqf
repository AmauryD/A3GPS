#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 23/10/17
	@Modified : 23/10/17
	@Description : 
**/
[["STR_MENU_STOPPING_PROCESS"] call misc_fnc_localize] call gps_menu_fnc_setGPSInfo;
terminate gps_curr_thread;
[] call gps_fnc_deletePathHelpers;
gps_current_goal = nil;
[["STR_MENU_MAP_CLEARED"] call misc_fnc_localize] call gps_menu_fnc_setGPSInfo;