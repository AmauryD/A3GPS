#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 23/10/17
	@Modified : 23/10/17
	@Description : 
		terminate the gps thread , delete the created namespaces , reset the path lines
	@Return : Nothing
**/
terminate gps_curr_thread;
[] call gps_fnc_deletePathHelpers;
[] call gps_fnc_deleteNameSpaces;
gps_current_goal = nil;