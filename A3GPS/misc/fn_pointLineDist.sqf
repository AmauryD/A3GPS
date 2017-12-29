params ["_point", "_start", "_end"];

_start params ["_startx","_starty"];
_point params ["_pointx","_pointy"];
_end params ["_endx","_endy"];

_dx = _endx - _startx;
_dy = _endy - _starty;

//Normalise
_mag = ((_dx ^ 2) + (_dy ^ 2)) ^ 0.5;

if(_mag > 0) then 
{
    _dx = _dx / _mag; 
    _dy = _dy / _mag;
};

_pvx = _pointx - _startx;
_pvy = _pointy - _starty;

//Get dot product (project pv onto normalized direction)
_pvdot = [[_dx,_dy],[_pvx,_pvy]] call BIS_fnc_dotProduct;

//Scale line direction vector
_dsx = _pvdot * _dx;
_dsy = _pvdot * _dy;

//Subtract this from pv
_ax = _pvx - _dsx;
_ay = _pvy - _dsy;

((_ax ^ 2) + (_ay ^ 2)) ^ 0.5


/*
_n = [_end,_start] call bis_fnc_vectorDiff;
_pa = [_start,_point] call bis_fnc_vectorDiff;

_c = [_n,(
	([_pa,_n] call BIS_fnc_dotProduct) / 
	([_n,_n] call BIS_fnc_dotProduct)
)] call bis_fnc_vectorMultiply;

_d = [_pa,_c] call bis_fnc_vectorDiff;

sqrt ( [_d,_d] call BIS_fnc_dotProduct );
*/