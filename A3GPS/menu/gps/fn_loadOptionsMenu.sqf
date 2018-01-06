#include "..\..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 4/02/17
	@Description : the GPS menu init , difficult to read but i really don't like making menus
**/

disableSerialization;

if(!isNull findDisplay 369854) exitWith {};

createDialog "GPS_MENU_OPTIONS";
_display = findDisplay 369854;

_lang_list = _display displayCtrl 2100;
_lang_text =  _display displayCtrl 1001;

_markers_text = _display displayCtrl 1000;
_colors_list = _display displayCtrl 2101;

_drop_data_btn = _display displayCtrl 1600;

_save_path_text = _display displayCtrl 1002;

_open_close_key_btn = _display displayCtrl 1601;
_switch_key_btn = _display displayCtrl 1602;
_exec_key_btn = _display displayCtrl 1603;

_quick_header = _display displayCtrl 1014;

_open_close_key_btn ctrlSetText (["STR_MENU_QUICKNAV_CLOSE_KEY"] call misc_fnc_localize);
_switch_key_btn ctrlSetText (["STR_MENU_QUICKNAV_SWITCH_KEY"] call misc_fnc_localize);
_exec_key_btn ctrlSetText (["STR_MENU_QUICKNAV_EXEC_KEY"] call misc_fnc_localize); 
_quick_header ctrlSetText (["STR_MENU_QUICKNAV_HEADER"] call misc_fnc_localize);

_drop_data_btn ctrlSetText (["STR_MENU_DROP_DATA"] call misc_fnc_localize);
_markers_text ctrlSetText (["STR_MENU_OPTIONS_MARKERS"] call misc_fnc_localize);
_lang_text ctrlSetText (["STR_MENU_OPTIONS_LANG"] call misc_fnc_localize);

_color = ["markers_color"] call misc_fnc_getSetting;
_lang = ["lang"] call misc_fnc_getSetting;

{
	_idx = _lang_list lbAdd (getText _x);
	_lang_list	lbSetData [_idx,(configName _x)];
	if(configName _x isEqualTo _lang) then {
		_lang_list lbSetCurSel _idx;
	};
}foreach (configProperties [(missionConfigFile >> "GPS_localization" >> "STR_LANGUAGES")]);

{	
	_index = _colors_list lbAdd (_x select 0);
	_colors_list lbSetData [_index,_x select 1];
	_colors_list lbSetPicture [_index,((_x select 2) call bis_fnc_colorRGBAToTexture)];

	if(_color == _x select 1) then {
		_colors_list lbSetCurSel _forEachIndex;
	};
}forEach [["","colorRed",[1,0,0,1]],["","colorYellow",[1,1,0,1]],["","colorBlue",[0,0,1,1]],["","ColorWhite",[1,1,1,1]],["","ColorGreen",[0,1,0,1]]];

_open_close_key_btn ctrlAddEventHandler ["ButtonClick",{
	_this spawn {
		disableSerialization;
		params ["_ctrl"];
		_key = [ctrlParent _ctrl,["quicknav_open_key"] call misc_fnc_getSetting] call misc_fnc_keyChoose;
		if (_key isEqualTo -1) exitWith {};
		["quicknav_open_key",_key] call misc_fnc_setSetting;
		_ctrl ctrlSetTooltip keyName (["quicknav_open_key"] call misc_fnc_getSetting);
	};
}];
_switch_key_btn ctrlAddEventHandler ["ButtonClick",{
	_this spawn {
		disableSerialization;
		params ["_ctrl"];
		_key = [ctrlParent _ctrl,["quicknav_switch_key"] call misc_fnc_getSetting] call misc_fnc_keyChoose;
		if (_key isEqualTo -1) exitWith {};
		["quicknav_switch_key",_key] call misc_fnc_setSetting;
		_ctrl ctrlSetTooltip keyName (["quicknav_switch_key"] call misc_fnc_getSetting);
	};
}];
_exec_key_btn ctrlAddEventHandler ["ButtonClick",{
	_this spawn {
		disableSerialization;
		params ["_ctrl"];
		_key = [ctrlParent _ctrl,["quicknav_execute_key"] call misc_fnc_getSetting] call misc_fnc_keyChoose;
		if (_key isEqualTo -1) exitWith {};
		["quicknav_execute_key",_key] call misc_fnc_setSetting;
		_ctrl ctrlSetTooltip keyName (["quicknav_execute_key"] call misc_fnc_getSetting);
	};
}];


_drop_data_btn ctrlAddEventHandler ["ButtonClick",{ //reset some things , i don't know why this exists
	[] spawn {
		if([["STR_MENU_CONFIRM_DROP_DATA_CONTENT"] call misc_fnc_localize, ["STR_MENU_CONFIRM_DROP_DATA_TITLE"] call misc_fnc_localize, true, true , findDisplay 369854] call BIS_fnc_guiMessage) then {
			profileNamespace setVariable ["gps_saved",nil];
			profileNamespace setVariable ["gps_settings",nil];
			[] call gps_fnc_refreshCache;
			(findDisplay 369852) closeDisplay 0;
			(findDisplay 369854) closeDisplay 0;
		};
	};
}]; 

_colors_list ctrlAddEventHandler ["LBSelChanged",{
	params ["_control","_index"];

	_type = _control lbData _index;

	["markers_color",_type] call misc_fnc_setSetting;
	{_x setMarkerColorLocal	_type}foreach gps_local_markers;
}];

_lang_list ctrlAddEventHandler ["LBSelChanged",{
	params ["_control","_index"];

	_type = _control lbData _index;

	["lang",_type] call misc_fnc_setSetting;
	(findDisplay 369854) closeDisplay 0;
	(findDisplay 369852) closeDisplay 0;
	[] spawn gps_menu_fnc_loadGPSMenu;
}];

_open_close_key_btn ctrlSetTooltip keyName (["quicknav_open_key"] call misc_fnc_getSetting);
_switch_key_btn ctrlSetTooltip keyName (["quicknav_switch_key"] call misc_fnc_getSetting);
_exec_key_btn ctrlSetTooltip keyName (["quicknav_execute_key"] call misc_fnc_getSetting);