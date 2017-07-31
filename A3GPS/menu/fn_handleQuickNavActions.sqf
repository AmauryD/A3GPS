disableSerialization;


private _key = _this select 1;
private _shift = _this select 2;
private _ctrl = _this select 3;
private _alt = _this select 4;

_handled = false;

_hudDisplay = uiNamespace getVariable ["gps_quickNav",displayNull];

if(dialog) exitWith {_handled};

if(_key == 15) then  { 
	if !(isNull _hudDisplay) exitWith {
		("gps_quickNav" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
		_handled = true;

	};
	("gps_quickNav" call BIS_fnc_rscLayer) cutRsc ["gps_quickNav","PLAIN", 1 , false]; //show
	_hudDisplay = uiNamespace getVariable ["gps_quickNav",displayNull];
	{
		_x ctrlSetPosition (_x getVariable "originalPos");
		_x ctrlCommit 0.2;
	}foreach allControls _hudDisplay;
	_handled = true;
};
if(_key == 42) then { //42 !!!!!!!!!!!!!!!!
	if !(isNull _hudDisplay) then {
		_btn = _hudDisplay displayCtrl 1600;
		_hudDisplay setVariable ["selOpt",(_hudDisplay getVariable "selOpt") + 1];
		_options = _hudDisplay getVariable ["options",[]];

		_idx = _hudDisplay getVariable "selOpt";

		if(_idx > count _options) then {
			_hudDisplay setVariable ["selOpt",0];
			_idx = _hudDisplay getVariable "selOpt";
		};

		_btn ctrlSetText ((_options select _idx) select 0);
		_handled = true;
	};

};
if(_key	== 28) then {
	if !(isNull _hudDisplay) then {
		_options = _hudDisplay getVariable ["options",[]];
		_idx = _hudDisplay getVariable "selOpt";

		[] spawn ((_options select _idx) select 1);
		_handled = true;
	};
};
_handled