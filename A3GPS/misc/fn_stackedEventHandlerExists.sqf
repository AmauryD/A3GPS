/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 4/02/17
	@Description : check if stacked EH exists , not used now in GPS but can be usefull
**/

private _name = param [0,"",[""]];
private _type = param [1,"",[""]];
private _exists = false;

if !(tolower _type in ["oneachframe","onplayerconnected","onplayerdisconnected","onmapsingleclick","onpreloadstarted","onpreloadfinished"]) exitWith {_exists};

_EHs = missionNamespace getVariable [format["BIS_stackedEventHandlers_%1",_type],[]];

{
	if(_x select 0 == _name) then {	
		_exists = true;
	};
}foreach _EHs;

_exists