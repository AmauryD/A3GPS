#include "..\..\..\macros.h"
// G:dist from start | H dist from end | F G+H

scopeName "main_algorithm";

private _start = diag_tickTime;

params [
	"_startRoute",
	"_goalRoute",
	"_nameSpace",
	["_heuristicModifier",["heuristic_modifier"] call gps_fnc_getConfigSetting,[0]]
];

private _open_list = [];
private _closed_list = [gps_max_road_index] call misc_fnc_hashTable_create;

[_nameSpace,parseNumber str _startRoute,[objNull,_startRoute,0,0,0]] call misc_fnc_hashTable_set;
_open_list pushBack str _startRoute;

while {count _open_list != 0} do {
    private _qName = _open_list call gps_fnc_findLeast;
    private _qId = parseNumber _qName;
    private _qObject = [_nameSpace,_qId] call misc_fnc_hashTable_find;

    _qObject params ["","_parent_object","_parent_f","_parent_g","_parent_h"];

    _open_list deleteAt (_open_list find _qName);
    _connectedNodes = [gps_allCrossRoadsWithWeight,_qId] call misc_fnc_hashTable_find;

    {
        private _childObject = _x select 0;
        private _child_parent_link_weight = _x select 1;

        #ifdef GPS_DEV
            [str _childObject,getPosATL _childObject,str _childObject] call gps_fnc_createMarker;
        #endif

        private _g = _parent_g + _child_parent_link_weight;
        private _h = (_childObject distance2D _goalRoute) / _heuristicModifier;
        private _f = _g + _h;

        _successor = str _childObject;
        _successor_id = parseNumber _successor;
        
        if(_childObject isEqualTo _goalRoute) exitWith {
            _open_list pushBack _successor;
            [_nameSpace,_successor_id,[_parent_object,_childObject,_f,_g,_h]] call misc_fnc_hashTable_set;
            breakTo "main_algorithm";
        };

        if !(
            [_open_list,_successor,_f] call gps_fnc_isInList || 
            [_closed_list,_successor_id] call misc_fnc_hashTable_exists
        ) then {
            [_nameSpace,_successor_id,[_parent_object,_childObject,_f,_g,_h]] call misc_fnc_hashTable_set;
            _open_list pushBack _successor;
        };
    }foreach _connectedNodes;

    [_closed_list,_qId,true] call misc_fnc_hashTable_set;
};

_open_list = _open_list apply {
	[_nameSpace,parseNumber _x] call misc_fnc_hashTable_find
};

_open_list
