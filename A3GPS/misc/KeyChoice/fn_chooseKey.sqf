/**
	@autor : [utopia] Amaury
	one of my old scripts
**/

disableSerialization;

private _parent = param[0,findDisplay 46,[displayNull]];
private _display = _parent createDisplay "choseKeyMenu";
private _return  = -1;

(_display displayCtrl 1600) ctrlSetText (["STR_CANCEL"] call misc_fnc_localize);
(_display displayCtrl 1601) ctrlSetText (["STR_OK"] call misc_fnc_localize);
(_display displayCtrl 1000) ctrlSetText (["STR_MENU_KEY_CHOICE"] call misc_fnc_localize);

if(!canSuspend) exitWith {systemChat "can't suspend here"};

uinamespace setvariable ["lvl_currChosenKey",nil];
uinamespace setvariable ["lvl_currChosenKey_status",nil];

_ctrlButtonOK = _display displayCtrl 1601;
_ctrlButtonCancel  = _display displayCtrl 1600;

_ctrlButtonOK ctrlseteventhandler ["buttonclick","uinamespace setvariable ['lvl_currChosenKey_status',true]; true"];
_ctrlButtonCancel ctrlseteventhandler ["buttonclick","uinamespace setvariable ['lvl_currChosenKey_status',false]; true"];
_display displayaddeventhandler ["unload","uinamespace setvariable ['lvl_currChosenKey_status',false];"];
_ehKeyDown = _display displayaddeventhandler ["keydown",{
	_display = _this select 0;
	_key = _this select 1;

	(_display displayCtrl 1001) ctrlSetText (keyName _key);
	uinamespace setvariable ['lvl_currChosenKey',_key];
	true
}];

waituntil {!isnil {uinamespace getvariable "lvl_currChosenKey_status"}};

_display closeDisplay 0;

if (uinamespace getvariable "lvl_currChosenKey_status") then {
	_return = uinamespace getvariable "lvl_currChosenKey";
};

_return 