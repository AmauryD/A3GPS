#include "..\..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 28/10/17
	@Modified : 28/10/17
	@Description : 
**/
disableSerialization;

if !(isNull (uiNamespace getVariable ["gps_hud",displayNull])) exitWith {};

"gps_hud" cutRsc ["gps_hud","PLAIN", 1 , false]; //show

_hudDisplay = uiNamespace getVariable ["gps_hud",displayNull];

_map = _hudDisplay displayCtrl 2201;
_text = _hudDisplay displayCtrl 1000;
_backGround = _hudDisplay displayCtrl 2200;
_picture = _hudDisplay displayCtrl 1200;

_map mapCenterOnCamera true;

_map ctrlAddEventHandler ["Draw",{
	_map = _this select 0;
	_vehPlayer = vehicle player;
	_speed = speed _vehPlayer;
	_map drawIcon [
		getText (configFile/"CfgVehicles"/typeOf _vehPlayer/"Icon"),
		[1,1,1,1],
        visiblePosition _vehPlayer,
        24,
        24,
        0
	];
}];

_map ctrlAddEventHandler ["Draw",{[_this select 0,true] call gps_menu_fnc_drawPath}];