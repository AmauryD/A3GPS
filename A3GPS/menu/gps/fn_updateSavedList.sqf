#include "..\..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 8/05/17
	@Modified : 23/10/17
	@Description : nothing to say
**/

disableSerialization;

private _display = findDisplay 369852;
private _saved_paths_list = _display displayCtrl 1500;
private _saved_paths = profileNamespace getVariable ["gps_saved",[]];

lbClear _saved_paths_list;

{
	_name = _x select 0;
	_idx = _saved_paths_list lbAdd _name;
	_saved_paths_list lbSetData [_idx,_name];
}foreach _saved_paths;

lbSort _saved_paths_list;