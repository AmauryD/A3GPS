/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 5/02/17
	@Description : main gps algorithm based on Dijkstra's algorithm [https://en.wikipedia.org/wiki/Dijkstra's_algorithm]
				   If the script does not find the shortest path it's because the virtual mapping is not accurate , arma routes are a mess , some are considered connected and others not but they are collidding ...
				   Plus we can't dertermine the type of the road or assign vars to roads.
**/
scriptName "gps_main_thread";

private _saveName = "";
private _startRoute = getpos player;
private _endRoute = roadAt _this;

if(!scriptDone gps_curr_thread) exitWith {hintSilent "Le GPS est déjà en train de calculer un trajet"};
if(_endRoute isEqualTo objNull) exitWith {hintSilent "Veuillez sélectionner une route"};

gps_curr_thread = _thisScript;

_start = diag_tickTime;

["Initialisation"] call gps_menu_fnc_setGPSInfo;

[] call gps_fnc_deletePathHelpers;

_nearestStartNodeObject = [_startRoute,gps_onlyCrossRoads] call misc_fnc_nearestPos;
_nearestEndNodeObject = [_endRoute,gps_onlyCrossRoads] call misc_fnc_nearestPos;

gps_saveCurrent = ["Voulez-vous sauvegarder ce trajet ?", "Sauvegarde", true, true , findDisplay 369852] call BIS_fnc_guiMessage;
if(gps_saveCurrent) then {
	_saveName = ["Choisissez le nom du trajet",findDisplay 369852] call misc_fnc_editDialog;
	if(_saveName isEqualTo "") then {
		_saveName = format["%1-%2",text ([_nearestStartNodeObject] call misc_fnc_nearestLocation),text ([_nearestEndNodeObject] call misc_fnc_nearestLocation)];
	};
};

private _allThePath = [
    _saveName,
	getPosATL _nearestStartNodeObject,
	getPosATL _nearestEndNodeObject,
	[]
];

_color = [profileNamespace getVariable "gps_settings","markers_color"] call bis_fnc_getFromPairs;
_class = [profileNamespace getVariable "gps_settings","objects_color"] call bis_fnc_getFromPairs;

_m = [nil,getPosATL _nearestStartNodeObject,"Début","mil_dot",_color] call misc_fnc_createMarker;
gps_local_markers pushBack _m;
_m = [nil,getPosATL _nearestEndNodeObject,"Arrivée","mil_flag",_color] call misc_fnc_createMarker;
gps_local_markers pushBack _m;

{
   missionNamespace setVariable [format["gps_node_%1",str _x],[_x,-1,false]];
} forEach gps_onlyCrossRoads;

{
   missionNamespace setVariable [format["gps_predecessor_%1",str _x],[_x,objNull]];
} forEach gps_onlyCrossRoads;

private _currNodeObject = _nearestStartNodeObject;

[_currNodeObject,0] call gps_fnc_setNodeWeight;

_iteration = 0;

while {!(_currNodeObject isEqualTo _nearestEndNodeObject)} do {
 	_parent = [] call gps_fnc_getWeakestNode;
 	_parentObject = _parent select 0; _currNodeObject = _parentObject;

 	if(_parentObject isEqualTo objNull) exitWith { ["FATAL ERROR"] call gps_menu_fnc_setGPSInfo; };

 	_parentWeigth = _parent select 1;
 	[_parentObject] call gps_fnc_setNodePassedBy;

 	_connectedNodes = missionNamespace getVariable format["gps_cross_%1",str _parentObject];

 	{
 		_childObject = _x select 0;
 		_child_parent_link_weight = _x select 1;
 		_childWeight = [_childObject] call gps_fnc_getNodeWeight;
 		_childWasChecked = [_childObject] call gps_fnc_wasNodeChecked;

 		_total = _parentWeigth + _child_parent_link_weight;

 		if(!_childWasChecked && (_total < _childWeight) || _childWeight == -1) then {
 			_newChildWeight = _total;
 			[_childObject,_newChildWeight] call gps_fnc_setNodeWeight;
 			[_childObject,_parentObject] call gps_fnc_nodeAssignPredecessor;
 		};
 	}foreach _connectedNodes;

 	_iteration = _iteration + 1;

 	[format["Calcul en cours ... [route %1][%2]",str _currNodeObject,_iteration]] call gps_menu_fnc_setGPSInfo;
};

["Assemblage du chemin"] call gps_menu_fnc_setGPSInfo;

_current = _nearestEndNodeObject;
_path = [];

while{!(_current isEqualTo _nearestStartNodeObject)} do {
  _path pushBack _current;
  _current = [_current] call gps_fnc_getPredecessor;
};

reverse _path;

_allThePath set [3,(_path apply {getPosATL _x})];

[_path] call gps_fnc_generatePathHelpers;

if(gps_saveCurrent) then {
	(profileNamespace getVariable "gps_saved") pushBack _allThePath;
	if(!isNull findDisplay 369852) then {
		[] call gps_menu_fnc_updateSavedList;
	};
};

[format["Trajet généré en %1 secondes",round(diag_tickTime - _start)]] call gps_menu_fnc_setGPSInfo;

[_thisScript,_nearestEndNodeObject] spawn {
	scriptName "gps_wait_arrive";
	_handle = _this select 0;
	_end = _this select 1;
 	waitUntil {uisleep 1;!(_handle isEqualTo gps_curr_thread) || player distance _end < 10}; // wait for new search or player arrives at destination
 	if(player distance _end < 10) then {
 		[] call gps_fnc_deletePathHelpers;
 		[["CustomGPS", "arrived"],nil,nil,nil,nil,nil,true] call BIS_fnc_advHint;
 	};
};