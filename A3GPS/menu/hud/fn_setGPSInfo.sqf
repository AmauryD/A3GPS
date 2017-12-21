#include "..\..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 23/10/17
	@Description : update the HUD infos
**/
disableSerialization;

params [
	"_status",
	["_img","",[""]],
	["_goalText","",[""]]
];

_hudDisplay = uiNamespace getVariable ["gps_hud",displayNull];

if (isNull _hudDisplay) exitWith {};

_text = _hudDisplay displayCtrl 1000;
_picture = _hudDisplay displayCtrl 1200;
_goalDistance = _hudDisplay displayCtrl 1002;

if(_status != "" && _status != ctrlText _text) then {
	_text ctrlSetText _status;
};

if(_img != "" && _img != ctrlText _picture) then {
	_picture ctrlSetText _img;
};

if(_goalText != "" && _goalText != ctrlText _goalDistance) then {
	_goalDistance ctrlSetText _goalText;
};