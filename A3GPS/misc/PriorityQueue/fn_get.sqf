params ["_queue"];

_return = _queue select 0;
_queue deleteAt 0;
_return select 1;