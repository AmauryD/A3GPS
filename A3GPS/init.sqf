#include <macros.h>
/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 4/02/17
	@Description : Initialisation
**/

gps_config_entry = missionConfigFile >> "CfgGPS";
gps_dir = getText (gps_config_entry >> "dir");

gps_fnc_compile = compileFinal	preprocessFileLineNumbers (gps_dir + "misc\fn_compile.sqf");
gps_fnc_log = ["misc","fn_log",true] call gps_fnc_compile;

if(!canSuspend) exitWith {
	diag_log "Please execute the init in a suspension allowed context";
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

gps_fnc_refreshCache = ["misc","fn_refreshCache"] call gps_fnc_compile;

/** TEST FUNCTIONS **/
//dev_fnc_getConnectedSegments = "fn_getConnectedSegments" call gps_fnc_compile;

/** GPS MENU FUNCTIONS **/
gps_menu_fnc_loadGPSMenu =  ["menu","fn_loadGPSMenu"] call gps_fnc_compile;
gps_menu_fnc_setGPSInfo = ["menu","fn_setGPSInfo"] call gps_fnc_compile; // = update
gps_menu_fnc_gpsHelp = ["menu","fn_gpsHelp"] call gps_fnc_compile;
gps_menu_fnc_updateSavedList = ["menu","fn_updateSavedList"] call gps_fnc_compile;
gps_menu_fnc_runHud = ["menu","fn_runHud"] call gps_fnc_compile;
gps_menu_fnc_loadHud = ["menu","fn_loadHud"] call gps_fnc_compile;
gps_menu_fnc_loadQuickNav = ["menu","fn_loadQuickNav"] call gps_fnc_compile;
gps_menu_fnc_handleQuickNavActions = ["menu","fn_handleQuickNavActions"] call gps_fnc_compile;

//quicknav hooks
gps_menu_fnc_quickNavCreate = ["menu\quicknav","fn_quickNavCreate"] call gps_fnc_compile;
gps_menu_fnc_quickNavExecuteCurrentOption = ["menu\quicknav","fn_quickNavExecuteCurrentOption"]  call gps_fnc_compile;
gps_menu_fnc_quickNavNextOption =  ["menu\quicknav","fn_quickNavNextOption"] call gps_fnc_compile;

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

misc_fnc_localize = ["misc","fn_localize"] call gps_fnc_compile;
misc_fnc_getSetting = ["misc","fn_getSetting"] call gps_fnc_compile;
misc_fnc_setSetting = ["misc","fn_setSetting"] call gps_fnc_compile;

misc_fnc_hashTable_find = ["misc\hashTable","fn_find"] call gps_fnc_compile;
misc_fnc_hashTable_set = ["misc\hashTable","fn_set"] call gps_fnc_compile;
misc_fnc_hashTable_create = ["misc\hashTable","fn_create"] call gps_fnc_compile;

misc_fnc_relDirTo =  ["misc","fn_relDirTo"] call gps_fnc_compile;
misc_fnc_averageFromAngles = ["misc","fn_averageFromAngles"] call gps_fnc_compile;

["Compiling functions done"] call gps_fnc_log;

[] call gps_fnc_refreshCache;

gps_saveCurrent = false;
gps_init_done = false;
gps_local_markers =	[];
gps_curr_thread = scriptNull;
gps_status_text = "Pas de status";

gps_version = "2.0";

waitUntil {!isNull findDisplay 46};
waitUntil {!isNull player};

_handle = [] spawn gps_fnc_mapRoutes; 

waitUntil {	//wait for the virtual mapping to be done
   scriptDone _handle
};

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

	onMapSingleClick "
		private _nearestStartNodeObject = [_pos,gps_onlyCrossRoads] call misc_fnc_nearestPos;

		if(_shift) then {
			{deleteMarkerLocal _x;} forEach allMapMarkers;
			[nil,getPosATL _nearestStartNodeObject,'main','mil_dot'] call misc_fnc_createMarker;
			_connectedNodes = [gps_allCrossRoadsWithWeight,parseNumber str _nearestStartNodeObject] call misc_fnc_hashTable_find;

			{
				[nil,getPosATL (_x select 0),str (_x select 1),'mil_dot'] call misc_fnc_createMarker;
			}foreach _connectedNodes;
		}else{
			if(isNil 'gps_highways') then {gps_highways = [];};
			if(_alt) then {
				hintSilent str _pos;
				[nil,_pos,str _pos,'mil_dot'] call misc_fnc_createMarker;
				gps_highways pushBackUnique _pos;
				copyToClipboard str gps_highways;
			}else{
				
			};
		};

		true
	";
	player addAction ["GPS",gps_menu_fnc_loadGPSMenu];
#endif	

gps_init_done = true;

if(getNumber (gps_config_entry >> "default_keyHandling_enable") == 1) then {
	(findDisplay 46) displayAddEventHandler ["KeyDown",gps_menu_fnc_handleQuickNavActions];
};