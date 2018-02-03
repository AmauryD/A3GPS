#include "..\..\macros.h"
/**
  @Author : [Utopia] Amaury
  @Creation : 27/12/17
  @Modified : --
  @Description : 
**/
params [
	"_ctrl",
	["_isHUD",false,[false]]
];

_color = ["marker_color"] call gps_fnc_getSetting;
_colorTexture = _color call bis_fnc_colorRGBATOTexture;
_dir = getDir player;

_toDraw = missionNamespace getVariable ["gps_draw_points",[]];

if (_toDraw isEqualTo []) exitWith {};

_lastRoad = _toDraw select (count _toDraw - 1);

_scale = ctrlMapScale _ctrl;
_lookingAT = [_ctrl ctrlMapScreenToWorld [0.5,0.5],getPosATL player] select _isHUD;
_toDraw = _toDraw select {
	_x distance _lookingAT <= (_scale * 10000)
};

{
	_previous = _toDraw param [_forEachIndex - 1,_toDraw select _forEachIndex];
	_next = _toDraw select (_forEachIndex + 1);

	if (_x isEqualTo _lastRoad) exitWith {
		_ctrl drawIcon 
		[
			'\A3\ui_f\data\Map\Markers\Military\flag_CA.paa',
			_color,
			_x,
			32,
			32,
			0,
			'',
			1,
			0.03,
			'TahomaB',
			'right'
		];
	};
	if (isNil "_next") exitWith {};

	_ctrl drawRectangle 
	[
		[getPosATL _previous,getPosATL _x] call misc_fnc_midPoint,
		4.5,
		(_previous distance _x) / 1.75,
		[_previous getDir _x,(_previous getDir _x) - _dir] select _isHUD,
		_color,
		_colorTexture
	];
	_ctrl drawRectangle 
	[
		[getPosATL _x,getPosATL _next] call misc_fnc_midPoint,
		4.5,
		(_next distance _x) / 1.75,
		[_x getDir _next,(_x getDir _next) - _dir] select _isHUD,
		_color,
		_colorTexture
	];
}foreach _toDraw;