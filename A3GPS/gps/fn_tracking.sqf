#include "..\macros.h"
/**
  @Author : [Utopia] Amaury
  @Creation : 10/05/17
  @Modified : 18/06/17
  @Description : main 
**/

#define CORRECT_ANGLE(DIR) if (DIR < 0) then {DIR = DIR + 360};if (DIR > 360) then {DIR = DIR - 360}

private _path = +(_this select 0); // copy path
private _fullPath = +(_this select 1); // copy fullPath
private _fullPathNode = _fullPath apply	{_x select 0};	//divide fullPath in 2 arrays [Object] and [Direction]
private _fullPathDir = _fullPath apply	{_x select 1};

private _fn_findNextNode = {
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
		"lost"
	};

	_nextNode = _path select ((_path find _node) + 1);
	_idx = (_path find _node) - 1;

	if !(isNil "_nextNode") then {
		_nodeIdx = _fullPathNode find _node;
		_nextRoad = _fullPathNode select (_nodeIdx + 1);
		_dir_next = _fullPathDir select (_nodeIdx + 1);

		if(isNil "_nextRoad") then {
			_return = format["<img image='A3\ui_f\data\Map\Markers\Military\flag_CA.paa'/> Arrivée dans %1m",floor (vehicle player distance _node)];
			breakTo "main_fn";
		};

		_next_nextRoad = _fullPathNode select (_nodeIdx + 2);
		_dir_next_next = _fullPathDir select (_nodeIdx + 2);
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

			_cardinal = switch (true) do
			{	
				case (_dir >= 330): { "<img image='icons\arrow_up.paa'/>" + (["STR_ROAD_CONTINUE"] call misc_fnc_localize) };
				case (_dir >= 300): { "<img image='icons\arrow_up.paa'/>" + (["STR_ROAD_TURN_SLOW_LEFT"] call misc_fnc_localize) };
				case (_dir >= 180): { "<img image='icons\arrow_left.paa'/>" + (["STR_ROAD_TURN_LEFT"] call misc_fnc_localize) };
				case (_dir >= 60):  { "<img image='icons\arrow_right.paa'/>" + (["STR_ROAD_TURN_RIGHT"] call misc_fnc_localize) };
				case (_dir >= 30): { "<img image='icons\arrow_up.paa'/>" + (["STR_ROAD_TURN_SLOW_RIGHT"] call misc_fnc_localize) };
				default               { "<img image='icons\arrow_up.paa'/>" + (["STR_ROAD_CONTINUE"] call misc_fnc_localize) };
			};

			_return = format["%1 %2m",_cardinal,floor (vehicle player distance _node)];
			breakTo "main_fn";
		};

		_cardinal = switch (true) do
			{	
				case (_dir >= 330): { "<img image='icons\arrow_up.paa'/>" + (["STR_ROAD_CONTINUE"] call misc_fnc_localize) };
				case (_dir >= 300): { "<img image='icons\arrow_up.paa'/>" + (["STR_ROAD_TURN_SLOW_LEFT"] call misc_fnc_localize) };
				case (_dir >= 180): { "<img image='icons\arrow_left.paa'/>" + (["STR_ROAD_TURN_LEFT"] call misc_fnc_localize) };
				case (_dir >= 60):  { "<img image='icons\arrow_right.paa'/>" + (["STR_ROAD_TURN_RIGHT"] call misc_fnc_localize) };
				case (_dir >= 30): { "<img image='icons\arrow_up.paa'/>" + (["STR_ROAD_TURN_SLOW_RIGHT"] call misc_fnc_localize) };
				default               { "<img image='icons\arrow_up.paa'/>" + (["STR_ROAD_CONTINUE"] call misc_fnc_localize) };
			};
		_return = format["%1 %2m",_cardinal,floor (vehicle player distance _node)];
	};
	_return
};

private _color = ["markers_color"] call misc_fnc_getSetting;

while {true} do { //this script thread will be destroyed when arrived 
	scopeName "main_loop";

	_message = [_path,_fullPath,_fullPathNode,_fullPathDir] call _fn_getMessage;
	if(_message isEqualTo 0) then {
		private "_path";

		[] call gps_fnc_deletePathHelpers;

		private _startRoute = roadAt player;
		private _goalRoute = _fullPathNode select (count _fullPathNode - 1);

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
		gps_status_text = _message;
	};
	uiSleep 0.2;
};