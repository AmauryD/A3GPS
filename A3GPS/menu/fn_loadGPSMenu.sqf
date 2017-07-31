/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 4/02/17
	@Description : the GPS menu init , difficult to read but i really don't like making menus
**/

disableSerialization;

if(!isNull findDisplay 369852) exitWith {};

createDialog "GPS_MENU";
_display = findDisplay 369852;
_status_text = _display displayCtrl 1001;
_map = _display displayCtrl 2201;

_saved_paths_list = _display displayCtrl 1500;
_load_saved_path_btn = _display displayCtrl 1600;
_newpath_btn = _display displayCtrl 1601;
_delete_saved_path_btn = _display displayCtrl 1602;
_stop_path = _display displayCtrl 1603;
_drop_data_btn = _display displayCtrl 1604;
_close_btn = _display displayCtrl 1605;
_help_btn = _display displayCtrl 1606;


_drop_data_btn ctrlSetText (["STR_MENU_DROP_DATA"] call misc_fnc_localize);
_stop_path ctrlSetText (["STR_MENU_STOP_PROCESS"] call misc_fnc_localize);
_delete_saved_path_btn ctrlSetText (["STR_MENU_DELETE_SAVED_PATH"] call misc_fnc_localize);
_newpath_btn ctrlSetText (["STR_MENU_NEW_PATH"] call misc_fnc_localize);
_load_saved_path_btn ctrlSetText (["STR_MENU_LOAD_SAVED_PATH"] call misc_fnc_localize);


_markerColorPicker = _display displayCtrl 2101;
_langPicker = _display displayCtrl 2100;

_color = ["markers_color"] call misc_fnc_getSetting;
_lang = ["lang"] call misc_fnc_getSetting;

{
	_idx = _langPicker lbAdd (getText _x);
	_langPicker	lbSetData [_idx,(configName _x)];
	if(configName _x isEqualTo _lang) then {
		_langPicker lbSetCurSel _idx;
	};
}foreach (configProperties [(missionConfigFile >> "GPS_localization" >> "STR_LANGUAGES")]);

{	
	_index = _markerColorPicker lbAdd (_x select 0);
	_markerColorPicker lbSetData [_index,_x select 1];
	_markerColorPicker lbSetPicture [_index,((_x select 2) call bis_fnc_colorRGBAToTexture)];

	if(_color == _x select 1) then {
		_markerColorPicker lbSetCurSel _forEachIndex;
	};
}forEach [["","colorRed",[1,0,0,1]],["","colorYellow",[1,1,0,1]],["","colorBlue",[0,0,1,1]],["","ColorWhite",[1,1,1,1]],["","ColorGreen",[0,1,0,1]]];

[] call gps_menu_fnc_updateSavedList;

_delete_saved_path_btn ctrlAddEventHandler ["ButtonClick",{
	_display = findDisplay 369852;
	_saved_paths_list = _display displayCtrl 1500;

	_selected = _saved_paths_list lbData (lbCurSel _saved_paths_list);

	if(_selected == "") exitWith {};

	_array = profileNamespace getVariable ["gps_saved",[]];

	{
		if(_x select 0 isEqualTo _selected) then {
			[format["Chemin préchargé %1 a été supprimé.",_x select 0]] call gps_menu_fnc_setGPSInfo;
			_array deleteAt _forEachIndex;
		};
	}foreach _array;

	[] call gps_menu_fnc_updateSavedList;
}];
_delete_saved_path_btn ctrlAddEventHandler ["MouseButtonClick",{if((_this select 1) == 1) then {hintSilent parseText (["STR_MENU_HINT_DELETE_SAVED_PATH"] call misc_fnc_localize)}}];

_map ctrlAddEventHandler ["MouseButtonClick",{
	_control = _this select 0;
	_btn = _this select 1;
	_xCoord = _this select 2;
	_yCoord = _this select 3; 
	_shift = _this select 4;

	_pos = _control ctrlMapScreenToWorld [_xCoord, _yCoord];

	if(_shift) then {
		_pos spawn {
			try {
				_this call gps_fnc_main;
			}catch{		// Fatal error handling
				[format["Error : %1",_exception]] call gps_menu_fnc_setGPSInfo; 
				[] call gps_fnc_deletePathHelpers;
			};
		};
	};
}];

_newpath_btn ctrlAddEventHandler ["MouseButtonClick",{hintSilent parseText (["STR_MENU_HINT_NEW_PATH"] call misc_fnc_localize)}];

_stop_path ctrlAddEventHandler ["ButtonClick",{
	["Arrêt du processus et nettoyage de la carte."] call gps_menu_fnc_setGPSInfo;
	terminate gps_curr_thread;
	terminate gps_track_handle;
	[] call gps_fnc_deletePathHelpers;
	gps_saveCurrent = false;
	["Carte nettoyée."] call gps_menu_fnc_setGPSInfo;
}];
_stop_path ctrlAddEventHandler ["MouseButtonClick",{if((_this select 1) == 1) then {hintSilent parseText (["STR_MENU_HINT_STOP_PROCESS"] call misc_fnc_localize)}}];

_load_saved_path_btn ctrlAddEventHandler ["ButtonClick",{
	_display = findDisplay 369852;
	_saved_paths_list = _display displayCtrl 1500;

	_selected = _saved_paths_list lbData (lbCurSel _saved_paths_list);

	if(_selected == "") exitWith {};

	[_selected] spawn gps_fnc_loadSavedPath;
}];
_load_saved_path_btn ctrlAddEventHandler ["MouseButtonClick",{if((_this select 1) == 1) then {hintSilent parseText (["STR_MENU_HINT_LOAD_SAVED_PATH"] call misc_fnc_localize)}}];

_drop_data_btn ctrlAddEventHandler ["ButtonClick",{ //reset some things , i don't know why this exists
	[] spawn {
		if(["Etes vous sûr ? Cela va effacer toutes vos données", "Attention", true, true , findDisplay 369852] call BIS_fnc_guiMessage) then {
			profileNamespace setVariable ["gps_saved",[]];
			profileNamespace setVariable ["gps_settings",[
				["markers_color","colorBlue"]
			]];
			if(["GPS","onMapSingleClick"] call misc_fnc_stackedEventHandlerExists) then {
				["GPS","onMapSingleClick"] call bis_fnc_removeStackedEventHandler;
			};
			gps_saveCurrent = false;
			(findDisplay 369852) closeDisplay 0;
		};
	};
}]; 


_markerColorPicker ctrlAddEventHandler ["LBSelChanged",{
	_control = _this select 0;
	_index = _this select 1;

	_type = _control lbData _index;

	["markers_color",_type] call misc_fnc_setSetting;
}];

_langPicker ctrlAddEventHandler ["LBSelChanged",{
	_control = _this select 0;
	_index = _this select 1;

	_type = _control lbData _index;

	["lang",_type] call misc_fnc_setSetting;
	(findDisplay 369852) closeDisplay 0;
	[] spawn gps_menu_fnc_loadGPSMenu;
}];

_drop_data_btn ctrlAddEventHandler ["MouseButtonClick",{if((_this select 1) == 1) then {hintSilent parseText (["STR_MENU_HINT_DROP_DATA"] call misc_fnc_localize)}}];

_help_btn ctrlAddEventHandler ["ButtonClick",gps_menu_fnc_GPSHelp];
_close_btn ctrlAddEventHandler ["ButtonClick",{(findDisplay 369852) closeDisplay 0}];