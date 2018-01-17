#include "..\..\macros.h"
#define EH_MENU_NAME "menu_controls"
/**
	@Author : [Utopia] Amaury
	@Creation : --
	@Modified : --
	@Description : --
**/

disableSerialization;

if(!isNull findDisplay 369855) exitWith {};

// EH 
_canOpen = ["gps_menu_opening",[EH_MENU_NAME],true] call misc_fnc_callScriptedEventHandlerReturn;
if (!_canOpen) exitWith {};

[] call gps_fnc_refreshCache;

createDialog "gps_menu_controls";
_display = findDisplay 369855;
_controls_list = _display displayCtrl 1500;
_keys_list = _display displayCtrl 1501;
_del_btn = _display displayCtrl 1600;
_add_btn = _display displayCtrl 1601;
_header = _display displayCtrl 1001;

[missionNameSpace,"gps_menu_opened",[EH_MENU_NAME,_display]] spawn BIS_fnc_callScriptedEventHandler;

_header ctrlSetText (["STR_MENU_CONTROLS_HEADER"] call gps_fnc_localize);
_del_btn ctrlSetText (["STR_MENU_CONTROLS_DEL_KEY_BTN"] call gps_fnc_localize);
_add_btn ctrlSetText (["STR_MENU_CONTROLS_ADD_KEY_BTN"] call gps_fnc_localize);

{
	_name = [getText (_x >> "name")] call gps_fnc_localize;
	_idx = _controls_list lbAdd _name;
	_controls_list lbSetData [_idx,configName _x];
}foreach ("true" configClasses (missionConfigFile >> "CfgGPS" >> "Keys"));

// seems weird but it's fine
_display setVariable ["refresh_key_list",{
	params ["_list","_class"];
	_allKeys = [_class,[]] call gps_fnc_getSetting;

	lbClear _list;
	{
		_idx = _list lbAdd keyName _x;
		_list lbSetData [_idx,str _x];
	}foreach _allKeys;
}];

_controls_list ctrlAddEventHandler ["LBSelChanged",{
	params ["_list","_index"];

	_display = ctrlParent _list;
	_currentControl = _list lbData _index;
	_keys_list = _display displayCtrl 1501;

	if (_currentControl isEqualTo "") exitWith {};

	[_keys_list,_currentControl] call (_display getVariable "refresh_key_list");
}];

_del_btn ctrlAddEventHandler ["ButtonClick",{
	params ["_ctrl"];

	_display = ctrlParent _ctrl;
	_keys_list = _display displayCtrl 1501;
	_controls_list = _display displayCtrl 1500;

	_currentSel = lbCurSel _keys_list;
	_selected = _keys_list lbData _currentSel;
	_selectedControl = _controls_list lbData (lbCurSel _controls_list);

	if (_selected isEqualTo "" || _selectedControl isEqualTo "") exitWith {};

	_keys = [profileNamespace getVariable "gps_settings",_selectedControl,[]] call bis_fnc_getFromPairs;
	_keys deleteAt (_keys find parseNumber _selected);

	[_keys_list,_selectedControl] call (_display getVariable "refresh_key_list");
}];
_add_btn ctrlAddEventHandler ["ButtonClick",{
	_this spawn { // need to spawn for the keyChoose dialog
		disableSerialization;
		params ["_ctrl"];

		_display = ctrlParent _ctrl;
		_keys_list = _display displayCtrl 1501;
		_controls_list = _display displayCtrl 1500;

		_selectedControl = _controls_list lbData (lbCurSel _controls_list);

		if (_selectedControl isEqualTo "") exitWith {};

		_key = [_display] call misc_fnc_keyChoose;
		if (_key == -1) exitWith {};

		[profileNamespace getVariable "gps_settings",_selectedControl,_key] call bis_fnc_addToPairs;
		[_keys_list,_selectedControl] call (_display getVariable "refresh_key_list");
	};
}];