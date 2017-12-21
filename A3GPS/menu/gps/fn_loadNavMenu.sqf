#include "..\..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 4/02/17
	@Description : the GPS menu init , difficult to read but i really don't like making menus
**/

disableSerialization;

if(!isNull findDisplay 369853) exitWith {};

createDialog "GPS_MENU_MAP";
_display = findDisplay 369853;
_map = _display displayCtrl 2201;
_saved_list = _display displayCtrl 1500;
_saved_exec = _display displayCtrl 1600;
_saved_delete = _display displayCtrl 1601;


_saved_delete ctrlSetText (["STR_MENU_DELETE_SAVED_PATH"] call misc_fnc_localize);
_saved_exec ctrlSetText (["STR_MENU_LOAD_SAVED_PATH"] call misc_fnc_localize);



{
	_savedName = _x select 0;
	_locationGoal = _x select 1;

	_idx = _saved_list lbAdd _savedName;
	_saved_list lbSetTooltip [_idx,_savedName];
	_saved_list lbSetData [_idx,_savedName];

	_pic = switch(type ([_locationGoal] call misc_fnc_nearestLocation)) do
	{
		case "NameVillage": {"\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\spaceGarage_ca.paa"};
		case "NameCity": {"\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\spaceGarage_ca.paa"};
		case "NameCityCapital": {"\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\spaceGarage_ca.paa"};
		case "Hill": {"\A3\ui_f\data\Map\LocationTypes\hill_CA.paa"};
		default {"\A3\ui_f\data\Map\Markers\Military\dot_ca.paa"};
	};

	_saved_list lbSetPicture [_idx,_pic];
}foreach (profileNamespace getVariable ["gps_saved",[]]);


_map ctrlAddEventHandler ["Draw",{
	_map = _this select 0;
	_vehPlayer = vehicle player;

	_sideName = switch (playerSide) do { 
		case east: {  "opfor"}; 
		case west: {  "blufor" }; 
		case independent: { "independent" }; 
		case civilian: {  "civilian" }; 
	};

	_r = profileNameSpace getVariable format["map_%1_R",_sideName];
	_g = profileNameSpace getVariable format["map_%1_G",_sideName];
	_b = profileNameSpace getVariable format["map_%1_B",_sideName];
	_a = 1;


	_map drawIcon [
		getText (configFile/"CfgVehicles"/typeOf _vehPlayer/"Icon"),
		[_r,_g,_b,_a],
        visiblePosition _vehPlayer,
        24,
        24,
        direction _vehPlayer,
        name player
	];

	{
		_savedName = _x select 0;
		_locationGoal = _x select 1;

		_pic = switch(type ([_locationGoal] call misc_fnc_nearestLocation)) do
		{
			case "NameVillage": {"\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\spaceGarage_ca.paa"};
			case "NameCity": {"\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\spaceGarage_ca.paa"};
			case "NameCityCapital": {"\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\spaceGarage_ca.paa"};
			case "Hill": {"\A3\ui_f\data\Map\LocationTypes\hill_CA.paa"};
			default {"\A3\ui_f\data\Map\Markers\Military\dot_ca.paa"};
		};

		_map drawIcon [
			_pic,
			[0,0,1,1],
	        _locationGoal,
	        24,
	        24,
	        0,
	        _savedName
		];
	}foreach (profileNamespace getVariable ["gps_saved",[]]);
}];

_map ctrlAddEventHandler ["MouseButtonClick",{
	params ["_control","_btn","_xCoord","_yCoord","_shift"];

	_pos = _control ctrlMapScreenToWorld [_xCoord, _yCoord];

	if(_shift) then {
		_pos spawn {
			[_this] call gps_fnc_main;
		};
	};
}];

_saved_list ctrlAddEventHandler ["LBSelChanged",{
	params ["_list","_index"];

	_display = ctrlParent _list;
	_selected = _list lbData _index;
	_map = _display displayCtrl 2201;

	_array = profileNamespace getVariable ["gps_saved",[]];

	_selectedData = (_array select {(_x select 0) isEqualTo _selected}) select 0;
	_selectedData params ["_name","_pos"];

	ctrlMapAnimClear _map;
	_map ctrlMapAnimAdd [1, 0.05, _pos];
	CtrlMapAnimCommit _map;
}];

_saved_exec ctrlAddEventHandler ["ButtonClick",{
	_saved_paths_list = (ctrlParent (_this select 0)) displayCtrl 1500;

	_selected = _saved_paths_list lbData (lbCurSel _saved_paths_list);

	if(_selected == "") exitWith {};

	[_selected] spawn gps_fnc_loadSavedPath;
}];


_saved_delete ctrlAddEventHandler ["ButtonClick",{
	_saved_paths_list = (ctrlParent (_this select 0)) displayCtrl 1500;

	_selected = _saved_paths_list lbData (lbCurSel _saved_paths_list);

	if(_selected == "") exitWith {};

	_saved_paths_list lbDelete (lbCurSel _saved_paths_list);

	_array = profileNamespace getVariable ["gps_saved",[]];

	{
		if(_x select 0 isEqualTo _selected) exitWith {
			_array deleteAt _forEachIndex;
		};
	}foreach _array;
}];
