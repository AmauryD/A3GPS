#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 23/10/17
	@Modified : 23/10/17
	@Description : 
		terminate the gps thread , delete the created namespaces , reset the path lines
	@Return : Nothing
**/
terminate gps_current_thread;
[] call gps_fnc_deletePathHelpers;
[] call misc_fnc_hashTable_deleteNameSpaces;
gps_current_goal = nil;