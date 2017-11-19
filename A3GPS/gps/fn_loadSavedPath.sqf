#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 23/10/17
	@Description : load a saved path from profileNameSpace
**/
params [
	["_name","",[""]]
];

private _theRightPath = [];
private _color = ["markers_color"] call misc_fnc_getSetting;

{
	_savedName = _x select 0;

	if(_name isEqualTo _savedName) then {
		_theRightPath = _x select 1;
	};
}foreach (profileNamespace getVariable ["gps_saved",[]]);

_theRightPath call gps_fnc_main;