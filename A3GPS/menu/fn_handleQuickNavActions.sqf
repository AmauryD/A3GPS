disableSerialization;


private _key = _this select 1;
private _shift = _this select 2;
private _ctrl = _this select 3;
private _alt = _this select 4;

_handled = false;

_hudDisplay = uiNamespace getVariable ["gps_quickNav",displayNull];

if(dialog) exitWith {_handled};

_handled = switch(_key) do {
	case 15: {
		call gps_menu_fnc_quickNavCreate
	};
	case 54: {
		call gps_menu_fnc_quickNavNextOption
	};
	case 28: {
		call gps_menu_fnc_quickNavExecuteCurrentOption
	};
	default	{
		false
	};
};

_handled