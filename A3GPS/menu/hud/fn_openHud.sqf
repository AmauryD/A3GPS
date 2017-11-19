#include "..\..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 28/10/17
	@Modified : 28/10/17
	@Description : 
**/
disableSerialization;

("gps_hud" call BIS_fnc_rscLayer) cutRsc ["gps_hud","PLAIN", 1 , false]; //show

_hudDisplay = uiNamespace getVariable ["gps_hud",displayNull];

_map = _hudDisplay displayCtrl 2201;
_text = _hudDisplay displayCtrl 1000;
_backGround = _hudDisplay displayCtrl 2200;
_picture = _hudDisplay displayCtrl 1200;
_zoomMapControl = _hudDisplay displayCtrl 2204;

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
	_map ctrlMapAnimAdd [0,(0.02 max (_speed / 1000)) min 0.5,visiblePosition _vehPlayer];
	ctrlMapAnimCommit _map;
}];
_zoomMapControl ctrlAddEventHandler ["Draw",{
	_map = _this select 0;
	_vehPlayer = vehicle player;
	_speed = speed _vehPlayer;
	_map drawIcon [
		getText (configFile/"CfgVehicles"/typeOf _vehPlayer/"Icon"),
		[1,1,1,1],
        visiblePosition _vehPlayer,
        12,
        12,
        getDir _vehPlayer
	];
}];


{
	_x ctrlSetPosition (_x getVariable "originalPos");
	_x ctrlCommit 1;
}foreach ((allControls _hudDisplay) - [_zoomMapControl]);

uiSleep 1;