#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 23/10/17
	@Description : check if stacked EH exists , not used now in GPS but can be usefull
**/
params [
	["_name","",[""]],
	["_type","",[""]]
];

private _exists = false;

if !(tolower _type in ["oneachframe","onplayerconnected","onplayerdisconnected","onmapsingleclick","onpreloadstarted","onpreloadfinished"]) exitWith {_exists};

_EHs = missionNamespace getVariable [format["BIS_stackedEventHandlers_%1",_type],[]];

{
	if(_x select 0 == _name) then {	
		_exists = true;
	};
}foreach _EHs;

_exists