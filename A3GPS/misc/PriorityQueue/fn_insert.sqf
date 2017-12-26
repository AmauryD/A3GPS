params ["_queue","_element","_priority"];

_queue pushBack [_priority,_element];
_queue sort true;