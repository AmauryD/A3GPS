/**
	@Author : [Utopia] Amaury
	@Creation : --
	@Modified : --
	@Description : 'Choose a key' menu
	@Return : SCALAR - key number
**/

disableSerialization;

params [["_parent",findDisplay 46,[displayNull]],["_defaultKey",-1,[0]]];

private _display = _parent createDisplay "choseKeyMenu";
private _keyText = _display displayCtrl 1001;

(_display displayCtrl 1600) ctrlSetText (["STR_CANCEL"] call gps_fnc_localize);
(_display displayCtrl 1601) ctrlSetText (["STR_OK"] call gps_fnc_localize);
(_display displayCtrl 1000) ctrlSetText (["STR_MENU_KEY_CHOICE"] call gps_fnc_localize);

if (!canSuspend) exitWith {systemChat "can't suspend here"};

uinamespace setvariable ["lvl_currChosenKey",_defaultKey];
uinamespace setvariable ["lvl_currChosenKey_status",nil];

if (_defaultKey != -1) then {
	_keyText ctrlSetText keyName _defaultKey;
};

_ctrlButtonOK = _display displayCtrl 1601;
_ctrlButtonCancel  = _display displayCtrl 1600;

_ctrlButtonOK ctrlseteventhandler ["buttonclick","uinamespace setvariable ['lvl_currChosenKey_status',true]; true"];
_ctrlButtonCancel ctrlseteventhandler ["buttonclick","uinamespace setvariable ['lvl_currChosenKey_status',false]; true"];
_display displayaddeventhandler ["unload","uinamespace setvariable ['lvl_currChosenKey_status',false];"];
_ehKeyDown = _display displayaddeventhandler ["keydown",{
	params ["_display","_key"];

	(_display displayCtrl 1001) ctrlSetText (keyName _key);
	uinamespace setvariable ['lvl_currChosenKey',_key];
	true
}];

waituntil {!isnil {uinamespace getvariable "lvl_currChosenKey_status"}};

_display closeDisplay 0;

uinamespace getvariable "lvl_currChosenKey";