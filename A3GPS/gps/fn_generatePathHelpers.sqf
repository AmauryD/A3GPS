/**
  @Author : [Utopia] Amaury
  @Creation : 5/02/17
  @Modified : 6/02/17
  @Description : functions to create the markers and the arrows on the map with a node path
**/

private _path = param [0,[],[[]]];
private _color = ["markers_color"] call misc_fnc_getSetting;
private	_fullPath = [];

private _fn_findInSegment = {
	private _segment = _this select 0;
	private _road = _this select 1;
	private _return = [];
	{
		if(_x select 0 isEqualTo _road) exitWith {
			_return = _x select 1;
		};
	}foreach _segment;
	_return
};


_start = diag_tickTime;

{
	_point = _x;
	_nextPoint = _path select (_forEachIndex + 1);

	if !(isNil "_nextPoint") then {
		_theSegment = [gps_roadSegments,parseNumber str _point] call misc_fnc_hashTable_find;

		_theSegment = [_theSegment,_nextPoint] call _fn_findInSegment;

		if(_theSegment isEqualTo []) then {
			_direction = _point getDir _nextPoint;
			[str _x,getPosATL _x,"","mil_arrow",_color,[0.5,0.5],_direction] call gps_fnc_createMarker;
			_fullPath pushBack [_point,_direction];
		};

		{
			_nextRoad = _theSegment select (_forEachIndex + 1);

			if(isNil "_nextRoad") then { 
				_nextRoad = _nextPoint;
			};
			_direction = [_x,_nextRoad] call BIS_fnc_DirTo;

			[str _x,getPosATL _x,"","mil_arrow",_color,[0.5,0.5],_direction] call gps_fnc_createMarker;
			_fullPath pushBack [_x,_direction];
		}foreach _theSegment;
	};
}forEach _path;

_fullPath