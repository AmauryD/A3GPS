disableSerialization;

_hudDisplay = uiNamespace getVariable ["gps_hud",displayNull];

if(isNull _hudDisplay) exitWith {false};

_zoomControl = _hudDisplay displayCtrl 2204;
if !(ctrlShown _zoomControl) exitWith {false};
	
_zoomControl ctrlShow false;

true