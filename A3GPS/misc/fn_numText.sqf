private ["_number","_mod","_digots","_digitsCount","_modBase","_numberText"];

_number = param [0,0,[0]];
if (!finite _number) exitWith { str _number };

_mod = param [1,3,[0]];

_digits = _number call BIS_fnc_numberDigits;
_digitsCount = count _digits - 1;

_modBase = _digitsCount % _mod;
_numberText = "";

{
	_numberText = _numberText + str _x;
	if ((_forEachIndex - _modBase) % _mod == 0 && _forEachIndex != _digitsCount) then { _numberText = _numberText + "," };
} foreach _digits;

_numberText
