#include "..\..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 4/02/17
	@Description : the GPS menu init , difficult to read but i really don't like making menus
**/
#define EH_MENU_NAME "menu_options"

disableSerialization;

if(!isNull findDisplay 369854) exitWith {};

// EH 
_canOpen = ["gps_menu_opening",[EH_MENU_NAME],true] call misc_fnc_callScriptedEventHandlerReturn;
if (!_canOpen) exitWith {};

createDialog "GPS_MENU_OPTIONS";
_display = findDisplay 369854;

[missionNameSpace,"gps_menu_opened",[EH_MENU_NAME,_display]] spawn BIS_fnc_callScriptedEventHandler;

_lang_list = _display displayCtrl 2100;
_lang_text =  _display displayCtrl 1001;
_markers_text = _display displayCtrl 1000;
_colors_list = _display displayCtrl 2101;
_drop_data_btn = _display displayCtrl 1600;
_save_path_text = _display displayCtrl 1002;
_colors_pick = _display displayCtrl 1601;

_drop_data_btn ctrlSetText (["STR_MENU_DROP_DATA"] call gps_fnc_localize);
_markers_text ctrlSetText (["STR_MENU_OPTIONS_MARKERS"] call gps_fnc_localize);
_lang_text ctrlSetText (["STR_MENU_OPTIONS_LANG"] call gps_fnc_localize);

_color = ["marker_color"] call gps_fnc_getSetting;
_lang = ["lang"] call gps_fnc_getSetting;

{
	_idx = _lang_list lbAdd (getText _x);
	_lang_list	lbSetData [_idx,(configName _x)];
	if(configName _x isEqualTo _lang) then {
		_lang_list lbSetCurSel _idx;
	};
}foreach (configProperties [(missionConfigFile >> "GPS_localization" >> "STR_LANGUAGES")]);

_currentColor = ["marker_color"] call gps_fnc_getSetting;
_colors_pick ctrlSetBackgroundColor _currentColor;
_colors_pick ctrlSetBackgroundColor _currentColor;
_colors_pick ctrlSetTooltipColorBox _currentColor;
_colors_pick ctrlSetTooltipColorText _currentColor;
_colors_pick ctrlSetTooltip (_currentColor call bis_fnc_colorRGBATOHTML);

_drop_data_btn ctrlAddEventHandler ["ButtonClick",{ //reset some things , i don't know why this exists
	[] spawn {
		if([["STR_MENU_CONFIRM_DROP_DATA_CONTENT"] call gps_fnc_localize, ["STR_MENU_CONFIRM_DROP_DATA_TITLE"] call gps_fnc_localize, true, true , findDisplay 369854] call BIS_fnc_guiMessage) then {
			profileNamespace setVariable ["gps_saved",nil];
			profileNamespace setVariable ["gps_settings",nil];
			[] call gps_fnc_refreshCache;
			(findDisplay 369852) closeDisplay 0;
			(findDisplay 369854) closeDisplay 0;
		};
	};
}]; 

_colors_pick ctrlAddEventHandler ["ButtonClick",{
	_this spawn {
		disableSerialization;
		params ["_control","_index"];

		_color = [ctrlParent _control,["marker_color"] call gps_fnc_getSetting] call misc_fnc_colorPicker;
		if (_color isEqualTo []) exitWith {};
		["marker_color",_color] call gps_fnc_setSetting;
		_control ctrlSetBackgroundColor _color;
		_control ctrlSetTooltipColorBox _color;
		_control ctrlSetTooltipColorText _color;
		_control ctrlSetTooltip (_color call bis_fnc_colorRGBATOHTML);
	};
}];

_lang_list ctrlAddEventHandler ["LBSelChanged",{
	params ["_control","_index"];

	_type = _control lbData _index;

	["lang",_type] call gps_fnc_setSetting;
	(findDisplay 369854) closeDisplay 0;
	(findDisplay 369852) closeDisplay 0;
	[] spawn gps_menu_fnc_loadGPSMenu;
}];