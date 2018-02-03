#include "..\macros.h"
/**
  @Author : [Utopia] Amaury
  @Creation : 10/05/17
  @Modified : 18/06/17
  @Description : worst function ever
  I'll need a better way to do this , still have false/positive
**/
private _path = +(_this select 0); // copy path
private _fullPath = +(_this select 1); // copy fullPath
private _goal = _this select 2;

_path = [_path apply {getPosATL _x}] call gps_core_fnc_RDP;
_path = _path apply {[_x,1] call bis_fnc_nearestRoad};
_path deleteAt 0; // delete first node , she's useless

private _fn_findNextNode = {
	params ["_path","_fullPath"];

	_nearestRoadInFullPath = [getPosATL player,30,_fullPath] call misc_fnc_nearestRoadInArray;

	// if no road is found , exit
	if (isNull _nearestRoadInFullPath) exitWith {objNull};

	// select from the current node to the end
	_nextPathRange = _fullPath select [_fullPath find _nearestRoadInFullPath,count _fullPath];

	gps_draw_points = _nextPathRange;

	// select the nearest
	(_nextPathRange select {_x in _path}) param [0,objNull];
};

private _fn_vectorAngle = {
	params ["_vector_1","_vector_2"];
	_vector_1 params ["_x1","_y1"]; 
	_vector_2 params ["_x2","_y2"]; 
	(_y2 atan2 _x2) - (_y1 atan2 _x1)
};

private _fn_correctAngle = {
	params [["_dir",0,[0]]];

	_dir = if (_dir < 0) then {_dir + 360}else{_dir};
	_dir = if (_dir > 360) then {_dir - 360}else{_dir};
	_dir
};

private _color = ["marker_color"] call gps_fnc_getSetting;
private _return = true;

try {
	while {vehicle player distance _goal > 15} do { //this script thread will be destroyed when arrived 
		private ["_next_node","_dir"];

		// regarde sur le full path node la position du joueur par rapport à la fin
		_next_node = [_path,_fullPath] call _fn_findNextNode;

		if !(isNull _next_node) then {
			_next_node_index_fullPath = _fullPath find _next_node;

			if(_next_node_index_fullPath >= (count _fullPath - 2)) exitWith {
				[
					format [["STR_ROAD_ARRIVED_IN"] call gps_fnc_localize,(vehicle player distance _goal) toFixed 1],
					"A3\ui_f\data\Map\Markers\Military\flag_CA.paa",
					format ["%1Km",[vehicle player distance _goal,2] call misc_fnc_metersToKilometers]
				] call gps_menu_fnc_setGPSInfo;
			};

			_next_node_previous = if (_next_node_index_fullPath < 2) then {_fullPath select 0}else{_fullPath select (_next_node_index_fullPath - 2)};
			_next_node_next = _fullPath select (_next_node_index_fullPath + 2);

			_vector_1 = getPosASL _next_node vectorFromTo getPosASL _next_node_previous; 
			_vector_2 = getPosASL _next_node vectorFromTo getPosASL _next_node_next; 

			_angle = [_vector_2,_vector_1] call _fn_vectorAngle;
			_dir = [_angle] call _fn_correctAngle;

			#ifdef GPS_DEV
				deleteMarker "a";
				deleteMarker "b";
				deleteMarker "c";
				["a",getPos _next_node_previous,str _next_node_previous,nil,"ColorRed"] call misc_fnc_createMarker;
				["b",getPos _next_node_next,str _next_node_next,nil,"ColorGreen"] call misc_fnc_createMarker;
				["c",getPos _next_node,str _dir,nil,"ColorBlue"] call misc_fnc_createMarker;
			#endif

			if (_dir >= 135 && _dir <= 225) exitWith {
				_path deleteAt (_path find _next_node);
			};

			_infos = switch (true) do
			{	
				case (_dir >= 225):  {
					[
						["STR_ROAD_TURN_RIGHT"] call gps_fnc_localize,
						gps_dir + "icons\direction_fork_right.paa"
					]
				};
				case (_dir <= 135): { 
					[
						["STR_ROAD_TURN_LEFT"] call gps_fnc_localize,
						gps_dir + "icons\direction_fork_left.paa"
					]
				};
				default {
					[
						["STR_ROAD_TURN_LEFT"] call gps_fnc_localize,
						gps_dir + "icons\direction_fork_left.paa"
					]
				};
			};

			_dist = vehicle player distance _next_node;
			if (_dist > 1000) then {
				_infos set [0,format[_infos select 0,([_dist,2] call misc_fnc_metersToKilometers) + "Km"]];
			}else{
				_infos set [0,format[_infos select 0,(_dist toFixed 1) + "m"]];
			};

			_infos pushBack format ["%1Km",[vehicle player distance _goal,2] call misc_fnc_metersToKilometers];

			_infos call gps_menu_fnc_setGPSInfo;

			uiSleep 0.5;
		}else{
			if(isOnRoad vehicle player) then {
				throw "RECALCULATE_PATH";
			};
			[
				["STR_GPS_LOST"] call gps_fnc_localize,
				"A3\ui_f\data\Map\Markers\Military\unknown_CA.paa",
				format ["%1Km",[vehicle player distance _goal,2] call misc_fnc_metersToKilometers]
			] call gps_menu_fnc_setGPSInfo;
		};
	};
}catch{
	_return = false;
};

_return