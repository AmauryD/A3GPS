disableSerialization;

params [
	"_pos",
	["_forced",false,[true]]
];

_hudDisplay = uiNamespace getVariable ["gps_hud",displayNull];

if(isNull _hudDisplay) exitWith {false};

_zoomControl = _hudDisplay displayCtrl 2204;

if(ctrlShown _zoomControl && !_forced) exitWith {false};

_zoomControl ctrlShow true;

_zoomControl ctrlMapAnimAdd [1, 0.02, _pos];
ctrlMapAnimCommit _zoomControl;

true