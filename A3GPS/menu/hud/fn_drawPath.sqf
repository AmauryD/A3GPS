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
_colorRGBA = getArray (configFile >> "CfgMarkerColors" >> _color >> "color");
_scale = ((4 * 0.15) * 10^(abs log (ctrlMapScale _ctrl))) max 5; // from Waffle SS. (https://community.bistudio.com/wiki/drawIcon)
_dir = getDir player;

_toDraw = (missionNamespace getVariable ["gps_draw_points",[]]) select [0,_maxDraw];

{
	_next = _toDraw select (_forEachIndex + 1);
	if (isNil "_next") exitWith {
		_ctrl drawIcon 
		[
			'\A3\ui_f\data\Map\Markers\Military\flag_CA.paa',
			_colorRGBA,
			_x,
			_scale * 1.5,
			_scale * 1.5,
			0,
			'',
			1,
			0.03,
			'TahomaB',
			'right'
		];
	};
	_ctrl drawIcon 
	[
		'\A3\ui_f\data\Map\Markers\Military\arrow_CA.paa',
		_colorRGBA,
		_x,
		_scale,
		_scale,
		[_x getDir _next,(_x getDir _next) - _dir] select _isRelativeToPlayer,
		'',
		1,
		0.03,
		'TahomaB',
		'right'
	];
}foreach _toDraw;