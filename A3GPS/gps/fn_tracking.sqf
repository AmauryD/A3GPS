#include "..\macros.h"
/**
  @Author : [Utopia] Amaury
  @Creation : 10/05/17
  @Modified : 18/06/17
  @Description : worst function ever
**/
private _path = +(_this select 0); // copy path
private _fullPath = +(_this select 1); // copy fullPath
private _goal = _this select 2;
private _fullPathNode = _fullPath apply	{_x select 0};	//divide fullPath in 2 arrays [Object] and [Direction]
private _fullPathDir = _fullPath apply	{_x select 1};

private _fn_findNextNode = {
	params ["_path","_fullPathNode"];

	_currRoadIndex = _fullPathNode find ([getPosATL player,20,_fullPathNode] call misc_fnc_nearestRoadInArray); //searching nearestRoad in path to avoid road superposition problem
	_nextPath = _fullPathNode select [_currRoadIndex,(count _fullPathNode) - 1];
	private _next = objNull;

	{
		if(_x in _path) exitWith {
			_next = _x;
		};
	}foreach _nextPath;

	_next
};

private _fn_correctAngle = {
	params ["_dir"];

	if (_dir < 0) then {
		_dir = _dir + 360;
	};
	if (_dir > 360) then {
		_dir = _dir - 360;
	};

	_dir
};

private _color = ["markers_color"] call misc_fnc_getSetting;

while {vehicle player distance _goal > 15} do { //this script thread will be destroyed when arrived 
	private ["_next_node","_dir","_dir1","_dir2"];

	// regarde sur le full path node la position du joueur par rapport à la fin
	_next_node = [_path,_fullPathNode] call _fn_findNextNode;

	if !(isNull _next_node) then {
		_next_node_index_fullPath = _fullPathNode find _next_node;

		if(_next_node_index_fullPath >= (count _fullPath - 1)) exitWith {
			[
				format [["STR_ROAD_ARRIVED_IN"] call misc_fnc_localize,vehicle player distance _goal],
				"A3\ui_f\data\Map\Markers\Military\flag_CA.paa",
				format ["%1Km",[vehicle player distance [0,0,0],2] call misc_fnc_metersToKilometers]
			] call gps_menu_fnc_setGPSInfo;
		};

		_next_node_previous = if (_next_node_index_fullPath < 2) then {_fullPath select 0}else{_fullPath select (_next_node_index_fullPath - 2)};
		_next_node_next = _fullPath select (_next_node_index_fullPath + 2);

		_next_node_previous params ["_next_node_previous_node","_next_node_previous_dir"];
		_next_node_next params ["_next_node_next_node","_next_node_next_dir"];

		#ifdef GPS_DEV
			[nil,getPos _next_node_previous_node,str _next_node_previous_node,nil,"ColorRed"] call misc_fnc_createMarker;
			[nil,getPos _next_node_next_node,str _next_node_next_node,nil,"ColorGreen"] call misc_fnc_createMarker;
		#endif

		_dir1 = _next_node getDir _next_node_next_node;
		_dir1 = [_dir1 - _next_node_previous_dir] call _fn_correctAngle;

		_dir2 = _next_node_previous_node getDir _next_node;
		_dir2 = [_dir2 - _next_node_previous_dir] call _fn_correctAngle;

		_dir = [_dir1 - _dir2] call _fn_correctAngle;


		_infos = switch (true) do
		{	
			case (_dir >= 330): { 
				[
					["STR_ROAD_CONTINUE"] call misc_fnc_localize,
					["icons\direction_continue.paa"] call gps_fnc_composeFilePath
				]
			};
			case (_dir >= 300): { 
				[
					["STR_ROAD_TURN_SLOW_LEFT"] call misc_fnc_localize,
					["icons\direction_fork_slight_left.paa"] call gps_fnc_composeFilePath
				]
			};
			case (_dir >= 180): { 
				[
					["STR_ROAD_TURN_LEFT"] call misc_fnc_localize,
					["icons\direction_fork_left.paa"] call gps_fnc_composeFilePath
				]
			};
			case (_dir >= 60):  {
				[
					["STR_ROAD_TURN_RIGHT"] call misc_fnc_localize,
					["icons\direction_fork_right.paa"] call gps_fnc_composeFilePath
				]
			};
			case (_dir >= 30): { 
				 [
				 	["STR_ROAD_TURN_SLOW_RIGHT"] call misc_fnc_localize,
				 	["icons\direction_fork_slight_right.paa"] call gps_fnc_composeFilePath
				 ]
			};
			default {
				[
					["STR_ROAD_CONTINUE"] call misc_fnc_localize,
					["icons\direction_continue.paa"] call gps_fnc_composeFilePath
				]
			};
		};
		_dist = vehicle player distance _next_node;
		if (_dist > 1000) then {
			_infos set [0,format[_infos select 0,([_dist,2] call misc_fnc_metersToKilometers) + "Km"]];
		}else{
			_infos set [0,format[_infos select 0,str(round _dist) + "m"]];
		};

		_infos pushBack format ["%1Km",[vehicle player distance [0,0,0],2] call misc_fnc_metersToKilometers];

		_infos call gps_menu_fnc_setGPSInfo;
	}else{
		if(isOnRoad vehicle player) then {
			throw "RECALCULATE_PATH";
		};
	};

	uiSleep 1;
};

true