#include "..\..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : --
	@Modified : --
	@Description : Simple RGB color picker menu.
	@Return : ARRAY - R,G,B,A 
**/

disableSerialization;

params [
	["_parent",findDisplay 46,[displayNull]],
	["_defaultColor",uiNamespace getVariable ["colorPic_color",[0,0,0,1]],[[]]]
];
_defaultColor params ["_r","_g","_b"];

if(!canSuspend) exitWith {["can't suspend here"] call gps_fnc_log};

if (count _defaultColor isEqualTo 3) then {
	_defaultColor pushBack 1;
};

private _display = _parent createDisplay "colorPicker";
private _keyText = _display displayCtrl 1001;

(_display displayCtrl 1601) ctrlSetText (["STR_CANCEL"] call gps_fnc_localize);
(_display displayCtrl 1600) ctrlSetText (["STR_OK"] call gps_fnc_localize);
(_display displayCtrl 1000) ctrlSetText "ColorPicker";

_r_slider = _display displayCtrl 1900;
_g_slider = _display displayCtrl 1901;
_b_slider = _display displayCtrl 1902;
_colorFrame = _display displayCtrl 1800;

_r_slider sliderSetRange [0, 100];
_g_slider sliderSetRange [0, 100];
_b_slider sliderSetRange [0, 100];

_r_slider sliderSetPosition (_r * 100);
_g_slider sliderSetPosition (_g * 100);
_b_slider sliderSetPosition (_b * 100);
_colorFrame ctrlSetBackgroundColor _defaultColor;

// we're making a copy to not modify the original array
uinamespace setvariable ["colorPic_color",+_defaultColor];
uinamespace setvariable ["colorPic_status",nil];

_ctrlButtonOK = _display displayCtrl 1600;
_ctrlButtonCancel  = _display displayCtrl 1601;


_r_slider ctrlAddEventHandler ["SliderPosChanged",{
	params ["_ctrl","_change"];
	_display = ctrlParent _ctrl;
	_colorFrame = _display displayCtrl 1800;
	_currentColor = uiNamespace getVariable "colorPic_color";
	_currentColor set [0,(_change / 100)];
	_colorFrame ctrlSetBackgroundColor _currentColor;
}];
_g_slider ctrlAddEventHandler ["SliderPosChanged",{
	params ["_ctrl","_change"];
	_display = ctrlParent _ctrl;
	_colorFrame = _display displayCtrl 1800;
	_currentColor = uiNamespace getVariable "colorPic_color";
	_currentColor set [1,(_change / 100)];
	_colorFrame ctrlSetBackgroundColor _currentColor;
}];
_b_slider ctrlAddEventHandler ["SliderPosChanged",{
	params ["_ctrl","_change"];
	_display = ctrlParent _ctrl;
	_colorFrame = _display displayCtrl 1800;
	_currentColor = uiNamespace getVariable "colorPic_color";
	_currentColor set [2,(_change / 100)];
	_colorFrame ctrlSetBackgroundColor _currentColor;
}];

_ctrlButtonOK ctrlseteventhandler ["buttonclick","uinamespace setvariable ['colorPic_status',true]; true"];
_ctrlButtonCancel ctrlseteventhandler ["buttonclick","uinamespace setvariable ['colorPic_status',false]; true"];
_display displayaddeventhandler ["unload","uinamespace setvariable ['colorPic_status',false];"];

waituntil {!isnil {uinamespace getvariable "colorPic_status"}};

_display closeDisplay 0;

if (uinamespace getvariable "colorPic_status") then {
 	uinamespace getvariable "colorPic_color";
}else{
	[]
};