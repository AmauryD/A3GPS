#include "..\..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 20/10/17
	@Modified : 23/10/17
	@Description : nothing to say
**/
#define EH_MENU_NAME "quick_nav"

_hudDisplay = uiNamespace getVariable ["gps_quickNav",displayNull];

if !(isNull _hudDisplay) exitWith {
	"gps_quickNav" cutText ["","PLAIN"];
	true
};

_canOpen = ["gps_menu_opening",[EH_MENU_NAME],true] call misc_fnc_callScriptedEventHandlerReturn;
if (!_canOpen) exitWith {};

"gps_quickNav" cutRsc ["gps_quickNav","PLAIN", 1 , false]; //show

_hudDisplay = uiNamespace getVariable ["gps_quickNav",displayNull];

[missionNameSpace,"gps_menu_opened",[EH_MENU_NAME,_hudDisplay]] spawn BIS_fnc_callScriptedEventHandler;

{
	_x ctrlSetPosition (_x getVariable "originalPos");
	_x ctrlCommit 0.2;
}foreach allControls _hudDisplay;

true