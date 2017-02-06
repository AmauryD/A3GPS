/**
  @Author : [Utopia] Amaury
  @Creation : 5/02/17
  @Modified : 6/02/17
  @Description : functions to create the markers and the arrows on the map with a node path
**/

private _path = param [0,[],[[]]];
private _color = [profileNamespace getVariable "gps_settings","markers_color"] call bis_fnc_getFromPairs;
private _class = [profileNamespace getVariable "gps_settings","objects_color"] call bis_fnc_getFromPairs;

{
	_point = _x;
	_nextPoint = _path select (_forEachIndex + 1);

	if !(isNil "_nextPoint") then {
		_theSegment = gps_roadSegments select (gps_onlyCrossRoads find _point);

		_fn_findInSegment = {
			private _segment = _this select 0;
			private _road = _this select 1;
			private _return = [];
			{
				if(_x select 0 isEqualTo _road) then {
					_return = _x select 1;
				};
			}foreach _segment;
			_return
		};

		_theSegment = [_theSegment,_nextPoint] call _fn_findInSegment;

		{
			_nextRoad = _theSegment select (_forEachIndex + 1);
			if(isNil "_nextRoad") then { _nextRoad = _nextPoint };

			_pos = getPosATL _x;

			_direction = [_x,_nextRoad] call BIS_fnc_DirTo;
			_marker = [nil,_pos,"","mil_arrow",_color] call misc_fnc_createMarker;
			gps_local_markers pushBack _marker;

			_v = _class createVehicleLocal _pos;
			_v setPosATL [_pos select 0,_pos select 1,2.5];
			_v enableSimulation false;
			_v setDir _direction;

			gps_local_objects pushBack _v;

			_marker setMarkerSizeLocal [0.5,0.5];
			_marker setMarkerDirLocal _direction;
		}foreach _theSegment;
	};
}forEach _path;