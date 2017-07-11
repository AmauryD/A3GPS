#define GET_NODE(ROAD_NAME) [_nameSpace,parseNumber ROAD_NAME] call misc_fnc_hashTable_find

private _list = _this select 0;
private _successor = _this select 1;
private _f = _this select 2;
private _return = false;

if(_successor in _list) then {
    if(_f < (GET_NODE(_successor)) select 2) then {
        _return = true;
    };
};

_return