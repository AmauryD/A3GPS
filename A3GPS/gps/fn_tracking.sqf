#include "..\macros.h"
/**
  @Author : [Utopia] Amaury
  @Creation : 10/05/17
  @Modified : 18/06/17
  @Description : worst function ever
**/

#define CORRECT_ANGLE(DIR) if (DIR < 0) then {DIR = DIR + 360};if (DIR > 360) then {DIR = DIR - 360}

private _path = +(_this select 0); // copy path
private _fullPath = +(_this select 1); // copy fullPath
private _fullPathNode = _fullPath apply	{_x select 0};	//divide fullPath in 2 arrays [Object] and [Direction]
private _fullPathDir = _fullPath apply	{_x select 1};

private _fn_findNextNode = {
	_currRoadIndex = _fullPathNode find ([getPosATL player,50,_fullPathNode] call misc_fnc_nearestRoadInArray); //searching nearestRoad in path to avoid road superposition problem
	_nextPath = _fullPathNode select [_currRoadIndex,(count _fullPathNode) - 1];
	private _next = objNull;

	{
		if(_x in _path) exitWith {
			_next = _x;
		};
	}foreach _nextPath;

	_next
};
private _fn_getMessageFromDir = {
	_cardinal = switch (true) do
	{	
		case (_dir >= 330): { [["STR_ROAD_CONTINUE"] call misc_fnc_localize,"icons\arrow_up.paa"] };
		case (_dir >= 300): { [["STR_ROAD_TURN_SLOW_LEFT"] call misc_fnc_localize,"icons\arrow_up.paa"] };
		case (_dir >= 180): { [["STR_ROAD_TURN_LEFT"] call misc_fnc_localize,"icons\arrow_left.paa"] };
		case (_dir >= 60):  { [["STR_ROAD_TURN_RIGHT"] call misc_fnc_localize,"icons\arrow_right.paa"] };
		case (_dir >= 30): { [["STR_ROAD_TURN_SLOW_RIGHT"] call misc_fnc_localize,"icons\arrow_up.paa"] };
		default               { [["STR_ROAD_CONTINUE"] call misc_fnc_localize,"icons\arrow_up.paa"] };
	};
	_cardinal set [0,format[_cardinal select 0,round(vehicle player distance _node)]];
	_cardinal
};

private _fn_getMessage = {
	scopeName "main_fn";

	private	["_previousRoad","_dir_previous","_return"];

	private _path = _this select 0;
	private _fullPath = _this select 1;
	private _fullPathNode = _this select 2;
	private _fullPathDir = _this select 3;

	// regarde sur le full path node la position du joueur par rapport à la fin
	_node = [_path,_fullPath,_fullPathNode,_fullPathDir] call _fn_findNextNode;

	_return = "";

	if(isNull _node) exitWith {
		if(isOnRoad vehicle player) exitWith {0};
		[["STR_GPS_LOST"] call misc_fnc_localize]
	};

	_nextNode = _path select ((_path find _node) + 1);
	_idx = (_path find _node) - 1;

	if !(isNil "_nextNode") then {
		_nodeIdx = _fullPathNode find _node;

		private ["_nextRoad","_dir_next"];
		try {
			_nextRoad = [_fullPathNode,_nodeIdx + 1] call misc_fnc_safeSelect;
			_dir_next = [_fullPathDir,_nodeIdx + 1] call misc_fnc_safeSelect;
		}catch{
			[format["Error : %1",_exception]] call gps_fnc_log;
			_return = [""];
			breakTo "main_fn";
		};

		if(isNil "_nextRoad") then {
			_return = [format["Arrivée dans %1m",floor (vehicle player distance _node)]];
			breakTo "main_fn";
		};

		private ["_next_nextRoad","_dir_next_next"];

		try {
			_next_nextRoad = [_fullPathNode,_nodeIdx + 2] call misc_fnc_safeSelect;
			_dir_next_next = [_fullPathDir,_nodeIdx + 2] call misc_fnc_safeSelect;
		}catch{
			[format["Error : %1",_exception]] call gps_fnc_log;
			_return = [""];
			breakTo "main_fn";
		};

		_dir_node = _fullPathDir select _nodeIdx;
			
		if(_nodeIdx - 2 < 0) then {
			_previousRoad = _node;
			_dir_previous = _dir_node;
		}else{
			_previousRoad = _fullPathNode select (_nodeIdx - 2);
			_dir_previous = _fullPathDir select (_nodeIdx - 2);
		};

		_dir1 = _dir_next - _dir_previous; //subtract direction of unit
		_dir2 = _dir_node - _dir_previous;

		CORRECT_ANGLE(_dir1);
		CORRECT_ANGLE(_dir2);

		_dir = [[_dir1,_dir2]] call misc_fnc_averageFromAngles;

		if !(_next_nextRoad in _path) then {
			_dir3 = _dir_next_next - _dir_previous;
			_dir = [[_dir,_dir3]] call misc_fnc_averageFromAngles;
		};

		if(_dir >= 330 || _dir <= 30) then {
			_path deleteAt (_path find _node);
			breakTo "main_fn";
		};

		if(_nextRoad in _path) then {
			_dir = _dir_node - _dir_previous; //subtract direction of unit

			CORRECT_ANGLE(_dir);
			_return = [] call _fn_getMessageFromDir;
			breakTo "main_fn";
		};
		_return = [] call _fn_getMessageFromDir;
	};
	_return
};

private _color = ["markers_color"] call misc_fnc_getSetting;

while {true} do { //this script thread will be destroyed when arrived 
	scopeName "main_loop";

	_message = [_path,_fullPath,_fullPathNode,_fullPathDir] call _fn_getMessage;
	private _goalRoute = _fullPathNode select (count _fullPathNode - 1);
	if(_message isEqualTo 0) then {
		private "_path";

		[] call gps_fnc_deletePathHelpers;

		private _startRoute = roadAt player;

		try {
			[_startRoute] call gps_fnc_insertFakeNode;
			_path = [_startRoute,_goalRoute] call gps_fnc_generateNodePath;
		}catch{
			gps_status_text = _exception;
			breakTo "main_loop";
		};

		[nil,getPosATL _startRoute,["STR_START"] call misc_fnc_localize,"mil_dot",_color] call gps_fnc_createMarker;
		[nil,getPosATL _goalRoute,["STR_GOAL"] call misc_fnc_localize,"mil_flag",_color] call gps_fnc_createMarker;

		_fullPath = [_path] call gps_fnc_generatePathHelpers;
		_fullPathNode = _fullPath apply	{_x select 0};	//divide fullPath in 2 arrays [Object] and [Direction]
		_fullPathDir = _fullPath apply	{_x select 1};
	}else{
		[_message param [0],_message param [1],format["%1m",round (vehicle player distance _goalRoute)]] call gps_menu_fnc_setGPSInfo;
	};
	uiSleep 0.2;
};