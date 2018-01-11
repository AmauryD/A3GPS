#include "..\..\macros.h"
/**
  @Author : [Utopia] Amaury
  @Creation : 27/12/17
  @Modified : --
  @Description : 
**/
params [
	"_ctrl",
	["_isRelativeToPlayer",false,[false]],
	["_maxDraw",20000,[0]] //less fps drop on hud ?
];

_color = ["marker_color"] call misc_fnc_getSetting;
_colorTexture = _color call bis_fnc_colorRGBATOTexture;
_dir = getDir player;

_toDraw = (missionNamespace getVariable ["gps_draw_points",[]]) select [0,_maxDraw];

private _fn_midPoint = {
	params ["_a","_b"];
	[((_a select 0) + (_b select 0)) / 2,((_a select 1) + (_b select 1)) / 2,0]
};

{
	_previous = _toDraw param [_forEachIndex - 1,_toDraw select _forEachIndex];
	_next = _toDraw select (_forEachIndex + 1);
	if (isNil "_next") exitWith {
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
	_ctrl drawRectangle 
	[
		[_previous,_x] call _fn_midPoint,
		4.5,
		(_previous distance _x) / 1.75,
		[_previous getDir _x,(_previous getDir _x) - _dir] select _isRelativeToPlayer,
		_color,
		_colorTexture
	];
	_ctrl drawRectangle 
	[
		[_x,_next] call _fn_midPoint,
		4.5,
		(_next distance _x) / 1.75,
		[_x getDir _next,(_x getDir _next) - _dir] select _isRelativeToPlayer,
		_color,
		_colorTexture
	];
}foreach _toDraw;