#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 05/11/17
	@Description : is this usefull ? , delete markers locally from an array
		Return : Nothing
**/

params [
	["_markers",[],[[]]]
];

{deleteMarkerLocal _x}foreach _markers;