// SQF implementation of https://en.wikipedia.org/wiki/Ramer%E2%80%93Douglas%E2%80%93Peucker_algorithm

params ["_pointList",["_epsilon",30,[0]]];

if (count _pointList < 3) exitWith {_pointList};

private _dmax = 0;
private _index = 0;
private _end = count _pointList - 1;

for "_i" from 1 to _end step 1 do {
    private _d = [_pointList select _i,_pointList select 0,_pointList select _end] call misc_fnc_pointLineDist;

    if ( _d > _dmax ) then {
        _index = _i;
        _dmax = _d;
    };
};

if (_dmax > _epsilon) then {
    // resursive
    private _recResults1 = [_pointList select [0,_index + 1],_epsilon] call gps_fnc_RDP;
    private _recResults2 = [_pointList select [_index,_end],_epsilon] call gps_fnc_RDP;
    _recResults1 + _recResults2
}else{
    [_pointList select 0,_pointList select _end];
};