params ["_queue","_element","_priority"];

_start = diag_tickTime;

_queue pushBack [_priority,_element];
_queue sort true;

[format["took %1",diag_tickTime - _start]] spawn gps_fnc_log;