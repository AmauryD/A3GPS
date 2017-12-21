#include "..\..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 28/10/17
	@Modified : 28/10/17
	@Description : 
**/
disableSerialization;
_hudDisplay = uiNamespace getVariable ["gps_hud",displayNull];

{
	_pos = ctrlPosition _x;
	_x ctrlSetPosition [_pos select 0,_pos select 1,0,_pos select 3];
	_x ctrlCommit 0.5;
}foreach allControls _hudDisplay;

//uiSleep 0.5

"gps_hud" cutText ["","PLAIN"];