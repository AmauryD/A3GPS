_hudDisplay = uiNamespace getVariable ["gps_quickNav",displayNull];

if !(isNull _hudDisplay) exitWith {
	_options = _hudDisplay getVariable ["options",[]];
	_idx = _hudDisplay getVariable "selOpt";

	[] spawn ((_options select _idx) select 1);
	true
};
false