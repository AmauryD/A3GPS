/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 5/02/17
	@Description : load a saved path from profileNameSpace
**/

private _name = param [0,"",[""]];

_theRightPath = [];

["Initialisation du chemin préfait"] call gps_menu_fnc_setGPSInfo;

terminate gps_curr_thread;
[] call gps_fnc_deletePathHelpers;

{
	_savedName = _x select 0;

	if(_name isEqualTo _savedName) then {
		_theRightPath = _x;
	};
}foreach (profileNamespace getVariable "gps_saved");

_color = [profileNamespace getVariable "gps_settings","markers_color"] call bis_fnc_getFromPairs;
_class = [profileNamespace getVariable "gps_settings","objects_color"] call bis_fnc_getFromPairs;

_startRoad = roadAt (_theRightPath select 1);
_endRoad = roadAt (_theRightPath select 2);

_marker = [nil,getPosATL _startRoad,"Début","mil_dot",_color] call misc_fnc_createMarker;
gps_local_markers pushBack _marker;
_marker = [nil,getPosATL _endRoad,"Arrivée","mil_flag",_color] call misc_fnc_createMarker;
gps_local_markers pushBack _marker;

_nodesPath = (_theRightPath select 3) apply {[_x,gps_onlyCrossRoads] call misc_fnc_nearestPos}; //roadAt does not work properly , we need to find the nearest crossRoad

["Chargement du chemin préchargé"] call gps_menu_fnc_setGPSInfo;
[_nodesPath] call gps_fnc_generatePathHelpers;
["Chemin préchargé chargé"] call gps_menu_fnc_setGPSInfo;