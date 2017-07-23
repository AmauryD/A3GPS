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
private _closed_list = [];

CREATE_NODE(objNull,_startRoute,0,0,0);
_open_list pushBack str _startRoute;

while {count _open_list != 0} do {
    private _qName = _open_list call gps_fnc_findLeast;
    private _qObject = GET_NODE(_qName);

    _open_list deleteAt (_open_list find _qName);
    _connectedNodes = [gps_allCrossRoadsWithWeight,parseNumber _qName] call misc_fnc_hashTable_find;

    {
        _childObject = _x select 0;
        _child_parent_link_weight = _x select 1;

        _g = (_qObject select 3) + _child_parent_link_weight;
        _h = (_goalRoute distance _childObject) / _precision; //less impact 
        _f = _g + _h;
        
        _successor = str _childObject;
        
        if(_childObject isEqualTo _goalRoute) exitWith {
            CREATE_NODE(_qObject select 1,_childObject,_f,_g,_h);
            _open_list pushBack _successor;
            breakTo "main_algorithm";
        };

        if !([_open_list,_successor,_f] call gps_fnc_isInList || _successor in _closed_list) then {
            CREATE_NODE(_qObject select 1,_childObject,_f,_g,_h);
            _open_list pushBack _successor;
        };
    }foreach _connectedNodes;

    _closed_list pushBack _qName;
};

[format ["Astar took %1",diag_tickTime - _start]] call gps_menu_fnc_setGPSInfo;

if !(str _startRoute in _open_list) then {
    [_open_list,str _startRoute] call misc_fnc_pushFront;
};

_open_list = _open_list apply {GET_NODE(_x)};

_open_list
