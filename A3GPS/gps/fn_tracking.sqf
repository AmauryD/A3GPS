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

private _return = true;

try {
	while {vehicle player distance _goal > 15} do { //this script thread will be destroyed when arrived 
		scopeName "tracking_loop";

		private ["_next_node","_dir"];

		private _metric = ["metric"] call gps_fnc_getSetting;

		// regarde sur le full path node la position du joueur par rapport à la fin
		_next_node = [_path,_fullPath] call _fn_findNextNode;

		if !(isNull _next_node) then {
			_next_node_index_fullPath = _fullPath find _next_node;

			if(_next_node_index_fullPath >= (count _fullPath - 2)) exitWith {
				[
					format [["STR_ROAD_ARRIVED_IN"] call gps_fnc_localize,[vehicle player distance _goal,1,_metric] call misc_fnc_distanceStr],
					"A3\ui_f\data\Map\Markers\Military\flag_CA.paa",
					[vehicle player distance _goal,2] call misc_fnc_distanceStr
				] call gps_menu_fnc_setGPSInfo;
			};

			_next_node_previous = if (_next_node_index_fullPath < 2) then {_fullPath select 0}else{_fullPath select (_next_node_index_fullPath - 2)};
			_next_node_next = _fullPath select (_next_node_index_fullPath + 2);

			_vector_1 = getPosASL _next_node vectorFromTo getPosASL _next_node_next; 
			_vector_2 = getPosASL _next_node_previous vectorFromTo getPosASL _next_node; 

			// new select syntax omagad
			_diff = (_vector_1 # 0)*(_vector_2 # 1)-(_vector_1 # 1)*(_vector_2 # 0);
			_distanceToNode = vehicle player distance _next_node;

			if (_diff > 0.3) then {
				[
						format[["STR_ROAD_TURN_RIGHT"] call gps_fnc_localize,[_distanceToNode,2,_metric] call misc_fnc_distanceStr],
						gps_dir + "icons\direction_fork_right.paa",
						[vehicle player distance _goal,1,_metric] call misc_fnc_distanceStr
				] call gps_menu_fnc_setGPSInfo;
			}else{
				if (_diff < -0.3) then {
					[
						format[["STR_ROAD_TURN_LEFT"] call gps_fnc_localize,[_distanceToNode,2,_metric] call misc_fnc_distanceStr],
						gps_dir + "icons\direction_fork_left.paa",
						[vehicle player distance _goal,1,_metric] call misc_fnc_distanceStr
					] call gps_menu_fnc_setGPSInfo;
				}else{
					_path deleteAt (_path find _next_node);
					breakTo "tracking_loop";
				};
			};

			uiSleep 0.5;
		}else{
			if(isOnRoad vehicle player) then {
				throw "RECALCULATE_PATH";
			};
			[
				["STR_GPS_LOST"] call gps_fnc_localize,
				"A3\ui_f\data\Map\Markers\Military\unknown_CA.paa",
				[vehicle player distance _goal,1,_metric] call misc_fnc_distanceStr
			] call gps_menu_fnc_setGPSInfo;
		};
	};
}catch{
	_return = false;
};

_return