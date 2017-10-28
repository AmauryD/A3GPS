#include "..\..\..\macros.h"

#define CREATE_NODE(PARENT,ROAD_OBJECT,F,G,H) [_nameSpace,parseNumber str ROAD_OBJECT,[PARENT,ROAD_OBJECT,F,G,H]] call misc_fnc_hashTable_set
#define GET_NODE(ROAD_NAME) [_nameSpace,parseNumber ROAD_NAME] call misc_fnc_hashTable_find

// G:dist from start | H dist from end | F G+H
//Need to work with a namespace for a more 'POO' style

scopeName "main_algorithm";

private _start = diag_tickTime;

private _startRoute = _this select 0;
private _goalRoute = _this select 1;
private _nameSpace = _this select 2;
private _precision = param [3,1,[0]];

private _open_list = [];
private _closed_list = [gps_max_road_index] call misc_fnc_hashTable_create;

#ifdef GPS_DEV
    ["======== STARTING ASTAR ========"] call gps_fnc_log;

    ["======== PARAMS ========"] call gps_fnc_log;
    [format["Start road : %1",_startRoute]] call gps_fnc_log;
    [format["Goal road : %1",_goalRoute]] call gps_fnc_log;
    [format["Distance2D : %1",_startRoute distance2D _goalRoute]] call gps_fnc_log;
    [format["Precision : %1",_precision]] call gps_fnc_log;
    ["======== END PARAMS ========"] call gps_fnc_log;
#endif

CREATE_NODE(objNull,_startRoute,0,0,0);
_open_list pushBack str _startRoute;

while {count _open_list != 0} do {
    private _qName = _open_list call gps_fnc_findLeast;
    private _qObject = GET_NODE(_qName);

    #ifdef GPS_DEV
        [format["==== Found lightest road : %1 ====",_qName]] call gps_fnc_log;
        [format["F : %1",_qObject select 2]] call gps_fnc_log;
        [format["G : %1",_qObject select 3]] call gps_fnc_log;
        [format["H : %1",_qObject select 4]] call gps_fnc_log;
        
        [str _qObject,getPosATL(_qObject select 1),str (_qObject select 1)] call gps_fnc_createMarker;
    #endif

    _open_list deleteAt (_open_list find _qName);
    _connectedNodes = [gps_allCrossRoadsWithWeight,parseNumber _qName] call misc_fnc_hashTable_find;

    {
        _childObject = _x select 0;
        _child_parent_link_weight = _x select 1;

        #ifdef GPS_DEV
            [str _childObject,getPosATL _childObject,str _childObject] call gps_fnc_createMarker;
        #endif

        _g = (_qObject select 3) + _child_parent_link_weight;
        _h = (_childObject distance2D _goalRoute) / _precision;
        _f = _g + _h;

        #ifdef GPS_DEV
            [format["       ==== Connection : %1 ====",_childObject]] call gps_fnc_log;
            [format["       Weight link : %1",_child_parent_link_weight]] call gps_fnc_log;
        #endif
        
        _successor = str _childObject;
        
        if(_childObject isEqualTo _goalRoute) exitWith {
            CREATE_NODE(_qObject select 1,_childObject,_f,_g,_h);
            _open_list pushBack _successor;

            #ifdef GPS_DEV
                [format["Found goal , exiting ...",_qName]] call gps_fnc_log;
            #endif
            
            breakTo "main_algorithm";
        };

        if !(
            [_open_list,_successor,_f] call gps_fnc_isInList || 
            [_closed_list,parseNumber _successor] call misc_fnc_hashTable_exists
        ) then {
            CREATE_NODE(_qObject select 1,_childObject,_f,_g,_h);
            _open_list pushBack _successor;
        };
    }foreach _connectedNodes;

    [_closed_list,parseNumber _qName,true] call misc_fnc_hashTable_set;

    #ifdef GPS_DEV
    	["============== END WHILE =============="] call gps_fnc_log;
    #endif
};

#ifdef GPS_DEV
    [format ["Astar took %1",diag_tickTime - _start]] call gps_fnc_log;
#endif

_open_list = _open_list apply {GET_NODE(_x)};

_open_list
