#include <macros.h>
/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 22/10/17
	@Description : Initialization
**/



gps_dir = getText (missionConfigFile >> "CfgGPS" >> "gps_dir");

gps_fnc_compile = compileFinal	preprocessFileLineNumbers (gps_dir + "misc\fn_compile.sqf");
gps_fnc_log = ["misc","fn_log",true] call gps_fnc_compile;

if(!canSuspend) exitWith {
	["Please execute the init in a suspension allowed context"] call gps_fnc_log;
};

["Compiling functions..."] call gps_fnc_log;

/** GPS FUNCTIONS  **/
gps_fnc_mapRoutes = ["gps","fn_mapRoutes"] call gps_fnc_compile;
gps_fnc_mapNodeValues = ["gps","fn_mapNodeValues"] call gps_fnc_compile;
gps_fnc_roadsConnectedTo = ["gps","fn_roadsConnectedTo"] call gps_fnc_compile;
gps_fnc_loadSavedPath = ["gps","fn_loadSavedPath"] call gps_fnc_compile;
gps_fnc_deletePathHelpers =  ["gps","fn_deletePathHelpers"] call gps_fnc_compile;
gps_fnc_generatePathHelpers = ["gps","fn_generatePathHelpers"] call gps_fnc_compile;
gps_fnc_tracking = ["gps","fn_tracking"] call gps_fnc_compile;
gps_fnc_generateNodePath = ["gps","fn_generateNodePath"] call gps_fnc_compile;

gps_fnc_aStar = ["gps\algorithms\AStar","fn_AStar"] call gps_fnc_compile;
gps_fnc_findLeast = ["gps\algorithms\AStar","fn_findLeast"] call gps_fnc_compile;
gps_fnc_isInList = ["gps\algorithms\AStar","fn_isInList"] call gps_fnc_compile;
gps_fnc_navToNearest = ["gps","fn_navToNearest"] call gps_fnc_compile;

gps_fnc_main = ["gps","fn_main"] call gps_fnc_compile;

gps_fnc_waitArrive = ["gps","fn_waitArrive"] call gps_fnc_compile;
gps_fnc_insertFakeNode = ["gps","fn_insertFakeNode"] call gps_fnc_compile;
gps_fnc_createMarker = ["gps","fn_createMarker"] call gps_fnc_compile;
gps_fnc_getAllRoads = ["gps","fn_getAllRoads"] call gps_fnc_compile;

gps_fnc_loadWorldData = ["gps","fn_loadWorldData"] call gps_fnc_compile;
gps_fnc_refreshCache = ["misc","fn_refreshCache"] call gps_fnc_compile;
gps_fnc_killGPS = ["gps","fn_killGPS"] call gps_fnc_compile;
gps_fnc_isHighway = ["gps","fn_isHighWay"] call gps_fnc_compile;

/** TEST FUNCTIONS **/
//dev_fnc_getConnectedSegments = "fn_getConnectedSegments" call gps_fnc_compile;

/** GPS MENU FUNCTIONS **/

//HUD
_hudFolder = "menu\hud";
gps_menu_fnc_setGPSInfo = [_hudFolder,"fn_setGPSInfo"] call gps_fnc_compile; // = update
gps_menu_fnc_loadHud = [_hudFolder,"fn_loadHud"] call gps_fnc_compile;
gps_menu_fnc_openHud = [_hudFolder,"fn_openHud"] call gps_fnc_compile;
gps_menu_fnc_closeHud = [_hudFolder,"fn_closeHud"] call gps_fnc_compile;
gps_menu_fnc_HudZoomOnPos = [_hudFolder,"fn_hudZoomOnPos"] call gps_fnc_compile;
gps_menu_fnc_HudHideZoomOnPos = [_hudFolder,"fn_HudHideZoomOnPos"] call gps_fnc_compile;


//main menu
_gpsMenuFolder = "menu\gps";
gps_menu_fnc_gpsHelp = [_gpsMenuFolder,"fn_gpsHelp"] call gps_fnc_compile;
gps_menu_fnc_loadGPSMenu =  [_gpsMenuFolder,"fn_loadGPSMenu"] call gps_fnc_compile;
gps_menu_fnc_loadNavMenu =  [_gpsMenuFolder,"fn_loadNavMenu"] call gps_fnc_compile;
gps_menu_fnc_loadOptionsMenu =  [_gpsMenuFolder,"fn_loadOptionsMenu"] call gps_fnc_compile;

//quicknav
_quickNavFolder = "menu\quicknav";
gps_menu_fnc_quickNavCreate = [_quickNavFolder,"fn_quickNavCreate"] call gps_fnc_compile;
gps_menu_fnc_quickNavExecuteCurrentOption = [_quickNavFolder,"fn_quickNavExecuteCurrentOption"]  call gps_fnc_compile;
gps_menu_fnc_quickNavNextOption =  [_quickNavFolder,"fn_quickNavNextOption"] call gps_fnc_compile;
gps_menu_fnc_loadQuickNav = [_quickNavFolder,"fn_loadQuickNav"] call gps_fnc_compile;
gps_menu_fnc_handleQuickNavActions = [_quickNavFolder,"fn_handleQuickNavActions"] call gps_fnc_compile;
gps_menu_fnc_addQuickNavOption = [_quickNavFolder,"fn_addQuickNavOption"] call gps_fnc_compile;

/** MISCELLANEOUS FUNCTIONS **/
misc_fnc_createMarker = ["misc","fn_createmarker"] call gps_fnc_compile;
misc_fnc_deleteAllMarkers = ["misc","fn_deleteAllMarkers"] call gps_fnc_compile;
misc_fnc_nearestPos = ["misc","fn_nearestPos"] call gps_fnc_compile;
misc_fnc_farestPos = ["misc","fn_farestPos"] call gps_fnc_compile;
misc_fnc_nearestLocation = ["misc","fn_nearestLocation"] call gps_fnc_compile;
misc_fnc_stackedEventHandlerExists = ["misc","fn_stackedEventHandlerExists"] call gps_fnc_compile;
misc_fnc_editDialog = ["misc","fn_editDialog"] call gps_fnc_compile;
misc_fnc_pushFront = ["misc","fn_pushFront"] call gps_fnc_compile;
misc_fnc_nearestRoadInArray = ["misc","fn_nearestRoadInArray"] call gps_fnc_compile;
misc_fnc_nearestRoad = ["misc","fn_nearestRoad"] call gps_fnc_compile;
misc_fnc_safeSelect = ["misc","fn_safeSelect"] call gps_fnc_compile;
misc_fnc_getRoadBoundingBoxWorld = ["misc","fn_getRoadBoundingBoxWorld"] call gps_fnc_compile;
misc_fnc_getRoadDir = ["misc","fn_getRoadDir"] call gps_fnc_compile;
misc_fnc_arePolygonsOverlapping = ["misc","fn_arePolygonsOverlapping"] call gps_fnc_compile;
misc_fnc_arrayInsert = ["misc","fn_arrayInsert"] call gps_fnc_compile;
misc_fnc_metersToKilometers = ["misc","fn_metersToKilometers"] call gps_fnc_compile;

misc_fnc_localize = ["misc","fn_localize"] call gps_fnc_compile;
misc_fnc_getSetting = ["misc","fn_getSetting"] call gps_fnc_compile;
misc_fnc_setSetting = ["misc","fn_setSetting"] call gps_fnc_compile;

misc_fnc_PQ_get = ["misc\PriorityQueue","fn_get"] call gps_fnc_compile;
misc_fnc_PQ_insert = ["misc\PriorityQueue","fn_insert"] call gps_fnc_compile;

gps_fnc_getConfigSetting = ["misc","fn_getConfigSetting"] call gps_fnc_compile;

misc_fnc_hashTable_find = ["misc\hashTable","fn_find"] call gps_fnc_compile;
misc_fnc_hashTable_set = ["misc\hashTable","fn_set"] call gps_fnc_compile;
misc_fnc_hashTable_create = ["misc\hashTable","fn_create"] call gps_fnc_compile;
misc_fnc_hashTable_exists = ["misc\hashTable","fn_exists"] call gps_fnc_compile;
misc_fnc_hashTable_toIndexArray = ["misc\hashTable","fn_toIndexArray"] call gps_fnc_compile;

misc_fnc_relDirTo =  ["misc","fn_relDirTo"] call gps_fnc_compile;
misc_fnc_averageFromAngles = ["misc","fn_averageFromAngles"] call gps_fnc_compile;

["Compiling functions done"] call gps_fnc_log;

[] call gps_fnc_refreshCache;

gps_init_done = false;
gps_local_markers =	[];
gps_curr_thread = scriptNull;
gps_track_handle = scriptNull;

gps_version = "1.0";

waitUntil {!isNull findDisplay 46};
waitUntil {!isNull player};

_handle = [] spawn gps_fnc_mapRoutes; 

waitUntil {	//wait for the virtual mapping to be done
   scriptDone _handle
};


[
	["STR_QUICKNAV_OPTION_STATION"] call misc_fnc_localize,
	{
		[
			[player,nearestObjects [player,["Land_fs_feed_F"],5000]] call misc_fnc_nearestPos
		] spawn gps_fnc_navToNearest;
	}
] call gps_menu_fnc_addQuickNavOption;

[
	["STR_QUICKNAV_OPTION_TOWN"] call misc_fnc_localize,
	{
		[
			locationPosition ([getPosATL player,4000,["NameCity","NameVillage","NameCityCapital","NameLocal"]] call misc_fnc_nearestLocation)
		] spawn gps_fnc_navToNearest;
	}
] call gps_menu_fnc_addQuickNavOption;


#ifdef GPS_DEV
	player addAction ["Show all crossRoads",{
		{deleteMarker _x}foreach allMapMarkers;
		{
			[nil,getPosATL _x,str _x,'mil_dot'] call misc_fnc_createMarker;
		}foreach gps_onlyCrossRoads;
	}];

	player addAction ["Show all roads (near player)",{
		{deleteMarker _x}foreach allMapMarkers;
		{
			[nil,getPosATL _x,str _x,'mil_dot'] call misc_fnc_createMarker;
		}foreach (player nearRoads 1000);
	}];

	player addAction ["Node mode",{
		map_mode = "Node";
	}];
	player addAction ["Road mode",{
		map_mode = "Road";
	}];

	onMapSingleClick "
		private _nearestStartNodeObject = [_pos,gps_onlyCrossRoads] call misc_fnc_nearestPos;
		private _mode = missionNameSpace getVariable ['map_mode','Node'];

		if(_shift) then {
			switch(_mode) do {
				case 'Node': {
					{deleteMarkerLocal _x;} forEach allMapMarkers;
					[nil,getPosATL _nearestStartNodeObject,'main','mil_dot'] call misc_fnc_createMarker;
					_connectedNodes = [gps_allCrossRoadsWithWeight,parseNumber str _nearestStartNodeObject] call misc_fnc_hashTable_find;

					{
						[nil,getPosATL (_x select 0),str (_x select 1),'mil_dot'] call gps_fnc_createMarker;
					}foreach _connectedNodes;
				};
				case 'Road': {
					_road = roadAt _pos;
					if(isNull _road) exitWith {};
					{deleteMarkerLocal _x;} forEach allMapMarkers;
					[nil,getPosATL _road,'main','mil_dot'] call misc_fnc_createMarker;
					_connected = [_road] call gps_fnc_roadsConnectedTo;
					systemChat str _connected;
					{
						[nil,getPosATL _x,str _x,'mil_dot'] call gps_fnc_createMarker;
					}foreach _connected;
				};
			};
		};
		true
	";
#endif	

gps_init_done = true;

if((["default_keyHandling_enable"] call gps_fnc_getConfigSetting) == 1) then {
	(findDisplay 46) displayAddEventHandler ["KeyDown",gps_menu_fnc_handleQuickNavActions];
};