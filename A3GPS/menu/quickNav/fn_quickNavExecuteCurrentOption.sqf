#include "..\..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 20/10/17
	@Modified : 23/10/17
	@Description : nothing to say
**/

_hudDisplay = uiNamespace getVariable ["gps_quickNav",displayNull];

if !(isNull _hudDisplay) exitWith {
	_options = _hudDisplay getVariable ["options",[]];
	_idx = _hudDisplay getVariable ["selOpt",-1];

	if(_options isEqualTo []) exitWith {};
	if(_idx == -1) exitWith {};

	[] spawn ((_options select _idx) select 1);
	true
};
false