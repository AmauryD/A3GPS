#include "..\..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 4/02/17
	@Description : the GPS menu init , difficult to read but i really don't like making menus
**/
#define EH_MENU_NAME "menu_main"

disableSerialization;

if(!isNull findDisplay 369852) exitWith {};

// EH 
_canOpen = ["gps_menu_opening",[EH_MENU_NAME],true] call misc_fnc_callScriptedEventHandlerReturn;
if (!_canOpen) exitWith {};

[] call gps_fnc_refreshCache;

createDialog "GPS_MENU";
_display = findDisplay 369852;

[missionNameSpace,"gps_menu_opened",[EH_MENU_NAME,_display]] spawn BIS_fnc_callScriptedEventHandler;

_nav_btn = _display displayCtrl 2400;
_option_btn = _display displayCtrl 2401;
_help_btn = _display displayCtrl 2402;
_quit_btn = _display displayCtrl 2403;
_kill_btn = _display displayCtrl 2404;
_save_btn = _display displayCtrl 2405;
_controls_btn = _display displayCtrl 2406;

if !(gps_core_init_done) then {
	_nav_btn ctrlEnable false;
	[_nav_btn] spawn {
		disableSerialization;
		params ["_nav_btn"];
		private _count = 0;
		while {!gps_core_init_done && !isNull _nav_btn} do {
			_count = _count + 1;
			_text = ["STR_LOADING"] call gps_fnc_localize;
			for "_i" from 1 to _count do {
				_text = _text + ".";
			};
			_nav_btn ctrlSetTooltip _text;
			if(_count >= 3) then {
				_count = 0;
			};
			uisleep 0.5;
		};
		_nav_btn ctrlEnable true;
		_nav_btn ctrlSetTooltip  (["STR_MENU_TT_NAV"] call gps_fnc_localize);
	};
};
 
_kill_btn ctrlSetTooltip (["STR_MENU_TT_KILL"] call gps_fnc_localize);
_save_btn ctrlSetTooltip (["STR_MENU_TT_SAVE"] call gps_fnc_localize);
_nav_btn ctrlSetTooltip  (["STR_MENU_TT_NAV"] call gps_fnc_localize);
_help_btn ctrlSetTooltip (["STR_MENU_TT_HELP"] call gps_fnc_localize);
_option_btn ctrlSetTooltip (["STR_MENU_TT_OPTIONS"] call gps_fnc_localize);
_quit_btn ctrlSetTooltip (["STR_MENU_TT_QUIT"] call gps_fnc_localize);
_controls_btn ctrlSetTooltip (["STR_MENU_TT_CONTROLS"] call gps_fnc_localize);

_controls_btn ctrlAddEventHandler ["ButtonClick",gps_menu_fnc_loadControlsMenu];
_nav_btn ctrlAddEventHandler ["ButtonClick",gps_menu_fnc_loadNavMenu];
_help_btn ctrlAddEventHandler ["ButtonClick",gps_menu_fnc_GPSHelp];
_option_btn ctrlAddEventHandler ["ButtonClick",gps_menu_fnc_loadOptionsMenu];

_quit_btn ctrlAddEventHandler ["ButtonClick",{
	(ctrlParent (_this select 0)) closeDisplay 0;
}];

_kill_btn ctrlAddEventHandler ["ButtonClick",{
	[] call gps_fnc_killGPS;
	[] call gps_menu_fnc_closeHud;
}];

_save_btn ctrlAddEventHandler ["ButtonClick",{
	_this spawn {
		disableSerialization;
		params ["_control"];

		if (scriptDone gps_current_thread || isNil "gps_current_goal") exitWith {};

		_saveName = [["STR_SELECT_SAVED_PATH_NAME"] call gps_fnc_localize,ctrlParent _control] call misc_fnc_editDialog;

		if (_saveName isEqualTo "") exitWith {};
		
		_saved = profileNamespace getVariable ["gps_saved",[]];

		[_saved,worldName,[[_saveName,gps_current_goal]]] call bis_fnc_addToPairs;
	};
}];
