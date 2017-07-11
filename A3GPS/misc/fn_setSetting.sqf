private _key = param [0,"",[""]];
private _val = param [1,nil];

[profileNamespace getVariable "gps_settings",_key,_val] call bis_fnc_setToPairs;