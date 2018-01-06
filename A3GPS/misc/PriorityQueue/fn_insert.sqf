params ["_queue","_priority","_counter","_element"];

_queue pushBack [_priority, _counter, _element];
_queue sort true;