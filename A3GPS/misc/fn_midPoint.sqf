#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 17/01/18
	@Modified : --
	@Description : find mid point of 2 points
	@Return : ARRAY - vector3D
**/
params ["_a","_b"];

[((_a select 0) + (_b select 0)) / 2,((_a select 1) + (_b select 1)) / 2,0]