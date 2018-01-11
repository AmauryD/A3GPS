#include <macros.h>
/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 22/10/17
	@Description : Initialization
**/
misc_fnc_getCurrentDir = {
	params [["_fullPath","",[""]]];

	_fullPath = toLower _fullPath;
	_completeMissionName = toLower format [".%1",worldName];

	_missionDir = _fullPath select [(_fullPath find _completeMissionName) + count _completeMissionName];
	_allDirs = _missionDir splitString "\";
	if (count _allDirs <= 1) exitWith {
		""
	};
	_allDirs deleteAt (count _allDirs - 1);
	(_allDirs joinString "\") + "\";
};

gps_dir = [__FILE__] call misc_fnc_getCurrentDir;

gps_fnc_compile = compileFinal	preprocessFileLineNumbers (gps_dir + "misc\fn_compile.sqf");
gps_fnc_log = ["misc","fn_log",true] call gps_fnc_compile;

if (not canSuspend) exitWith {
	["Please execute the init in a suspension allowed context"] call gps_fnc_log;
};

["Compiling functions..."] call gps_fnc_log;

/** GPS FUNCTIONS  **/
gps_fnc_mapRoutes = ["gps","fn_mapRoutes"] call gps_fnc_compile;
gps_fnc_mapNodeValues = ["gps","fn_mapNodeValues"] call gps_fnc_compile;
gps_fnc_roadsConnectedTo = ["gps","fn_roadsConnectedTo"] call gps_fnc_compile;
gps_fnc_deletePathHelpers =  ["gps","fn_deletePathHelpers"] call gps_fnc_compile;
gps_fnc_generatePathHelpers = ["gps","fn_generatePathHelpers"] call gps_fnc_compile;
gps_fnc_deleteNameSpaces = ["gps","fn_deleteNameSpaces"] call gps_fnc_compile;
gps_fnc_tracking = ["gps","fn_tracking"] call gps_fnc_compile;
gps_fnc_generateNodePath = ["gps","fn_generateNodePath"] call gps_fnc_compile;
gps_fnc_composeFilePath = ["gps","fn_composeFilePath"] call gps_fnc_compile;

gps_fnc_main = ["gps","fn_main"] call gps_fnc_compile;

gps_fnc_insertFakeNode = ["gps","fn_insertFakeNode"] call gps_fnc_compile;
gps_fnc_getAllRoads = ["gps","fn_getAllRoads"] call gps_fnc_compile;

gps_fnc_refreshCache = ["misc","fn_refreshCache"] call gps_fnc_compile;
gps_fnc_killGPS = ["gps","fn_killGPS"] call gps_fnc_compile;
gps_fnc_isHighway = ["gps","fn_isHighWay"] call gps_fnc_compile;


/** GPS MENU FUNCTIONS **/
//HUD
_hudFolder = "menu\hud";
gps_menu_fnc_setGPSInfo = [_hudFolder,"fn_setGPSInfo"] call gps_fnc_compile; // = update
gps_menu_fnc_loadHud = [_hudFolder,"fn_loadHud"] call gps_fnc_compile;
gps_menu_fnc_openHud = [_hudFolder,"fn_openHud"] call gps_fnc_compile;
gps_menu_fnc_closeHud = [_hudFolder,"fn_closeHud"] call gps_fnc_compile;
gps_menu_fnc_drawPath = [_hudFolder,"fn_drawPath"] call gps_fnc_compile;

//main menu
_gpsMenuFolder = "menu\gps";
gps_menu_fnc_gpsHelp = [_gpsMenuFolder,"fn_gpsHelp"] call gps_fnc_compile;
gps_menu_fnc_loadGPSMenu =  [_gpsMenuFolder,"fn_loadGPSMenu"] call gps_fnc_compile;
gps_menu_fnc_loadNavMenu =  [_gpsMenuFolder,"fn_loadNavMenu"] call gps_fnc_compile;
gps_menu_fnc_loadOptionsMenu =  [_gpsMenuFolder,"fn_loadOptionsMenu"] call gps_fnc_compile;
gps_menu_fnc_loadControlsMenu =  [_gpsMenuFolder,"fn_loadControlsMenu"] call gps_fnc_compile;

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
misc_fnc_nearestLocation = ["misc","fn_nearestLocation"] call gps_fnc_compile;
misc_fnc_editDialog = ["misc","fn_editDialog"] call gps_fnc_compile;
misc_fnc_nearestRoadInArray = ["misc","fn_nearestRoadInArray"] call gps_fnc_compile;
misc_fnc_getRoadBoundingBoxWorld = ["misc","fn_getRoadBoundingBoxWorld"] call gps_fnc_compile;
misc_fnc_getRoadDir = ["misc","fn_getRoadDir"] call gps_fnc_compile;
misc_fnc_arePolygonsOverlapping = ["misc","fn_arePolygonsOverlapping"] call gps_fnc_compile;
misc_fnc_metersToKilometers = ["misc","fn_metersToKilometers"] call gps_fnc_compile;

misc_fnc_localize = ["misc","fn_localize"] call gps_fnc_compile;
misc_fnc_getSetting = ["misc","fn_getSetting"] call gps_fnc_compile;
misc_fnc_setSetting = ["misc","fn_setSetting"] call gps_fnc_compile;

misc_fnc_PQ_get = ["misc\PriorityQueue","fn_get"] call gps_fnc_compile;
misc_fnc_PQ_insert = ["misc\PriorityQueue","fn_insert"] call gps_fnc_compile;

misc_fnc_Q_get = ["misc\Queue","fn_get"] call gps_fnc_compile;
misc_fnc_Q_insert = ["misc\Queue","fn_insert"] call gps_fnc_compile;

gps_fnc_getConfigSetting = ["misc","fn_getConfigSetting"] call gps_fnc_compile;

gps_fnc_aStar = ["gps\algorithms\AStar","fn_AStar"] call gps_fnc_compile;
gps_fnc_RDP = ["gps\algorithms\RDP","fn_RDP"] call gps_fnc_compile;
misc_fnc_pointLineDist = ["misc","fn_pointLineDist"] call gps_fnc_compile;

_hashTableDir = "misc\hashTable";
misc_fnc_hashTable_find = [_hashTableDir,"fn_find"] call gps_fnc_compile;
misc_fnc_hashTable_set = [_hashTableDir,"fn_set"] call gps_fnc_compile;
misc_fnc_hashTable_create = [_hashTableDir,"fn_create"] call gps_fnc_compile;
misc_fnc_hashTable_exists = [_hashTableDir,"fn_exists"] call gps_fnc_compile;

misc_fnc_keyChoose = ["misc\KeyChoice","fn_chooseKey"] call gps_fnc_compile;
misc_fnc_colorPicker = ["misc\ColorPicker","fn_colorPick"] call gps_fnc_compile;

misc_fnc_callScriptedEventHandlerReturn = ["misc","fn_callScriptedEventHandlerReturn"] call gps_fnc_compile;

["Compiling functions done"] call gps_fnc_log;
[missionNameSpace,"gps_functions_compiled",[]] spawn BIS_fnc_callScriptedEventHandler;

[] call gps_fnc_refreshCache;

gps_init_done = false;
gps_fakeNodes = ["gps_fakeNodes"] call misc_fnc_hashTable_create;
gps_curr_thread = scriptNull;

waitUntil {!isNull findDisplay 46};
waitUntil {!isNull player};

#ifdef GPS_DEV 
	//uiSleep 2;
#endif

[missionNamespace,"gps_loaded",{
	[
		["STR_QUICKNAV_OPTION_STATION"] call misc_fnc_localize,
		{
			[
				[nearestObjects [player,["Land_fs_feed_F"],3000],player] call bis_fnc_nearestPosition
			] spawn gps_fnc_main;
		}
	] call gps_menu_fnc_addQuickNavOption;

	[
		["STR_QUICKNAV_OPTION_TOWN"] call misc_fnc_localize,
		{
			[
				[getPosATL player,4000,["NameCity","NameVillage","NameCityCapital","NameLocal"]] call misc_fnc_nearestLocation
			] spawn gps_fnc_main;
		}
	] call gps_menu_fnc_addQuickNavOption;

	(findDisplay 46) displayAddEventHandler ["KeyDown",gps_menu_fnc_handleQuickNavActions];
}] call bis_fnc_addScriptedEventHandler;

[] call gps_fnc_mapRoutes; 

/*
Too much fps lost with big paths
waitUntil {
  !isNull ((findDisplay 12) displayCtrl 51)
};
((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw",gps_menu_fnc_drawPath];
*/ 