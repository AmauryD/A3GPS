#include "..\..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 20/10/17
	@Modified : 23/10/17
	@Description : nothing to say
**/

_hudDisplay = uiNamespace getVariable ["gps_quickNav",displayNull];

if !(isNull _hudDisplay) exitWith {
	_btn = _hudDisplay displayCtrl 1600;
	_hudDisplay setVariable ["selOpt",(_hudDisplay getVariable "selOpt") + 1];
	_options = _hudDisplay getVariable ["options",[]];

	_idx = _hudDisplay getVariable "selOpt";

	if(_idx > count _options) then {
		_hudDisplay setVariable ["selOpt",0];
		_idx = _hudDisplay getVariable "selOpt";
	};

	_btn ctrlSetText ((_options select _idx) select 0);
	true
};
false