/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 4/02/17
	@Description : Initialisation
**/

/** GPS FUNCTIONS  **/
gps_fnc_mapRoutes = compileFinal preprocessFileLineNumbers "gps\fn_mapRoutes.sqf";
gps_fnc_mapNodeValues = compileFinal preprocessFileLineNumbers "gps\fn_mapNodeValues.sqf";
gps_fnc_roadsConnectedTo = compileFinal preprocessFileLineNumbers "gps\fn_roadsConnectedTo.sqf";
gps_fnc_loadSavedPath = compileFinal preprocessFileLineNumbers "gps\fn_loadSavedPath.sqf";
gps_fnc_deletePathHelpers =  compileFinal preprocessFileLineNumbers "gps\fn_deletePathHelpers.sqf";
gps_fnc_generatePathHelpers = compileFinal preprocessFileLineNumbers "gps\fn_generatePathHelpers.sqf";
gps_fnc_tracking = compileFinal preprocessFileLineNumbers "gps\fn_tracking.sqf";
gps_fnc_generateNodePath = compileFinal preprocessFileLineNumbers "gps\fn_generateNodePath.sqf";

gps_fnc_aStar = compileFinal preprocessFileLineNumbers "gps\algorithms\AStar\fn_AStar.sqf";
gps_fnc_findLeast = compileFinal preprocessFileLineNumbers "gps\algorithms\AStar\fn_findLeast.sqf";
gps_fnc_isInList = compileFinal preprocessFileLineNumbers "gps\algorithms\AStar\fn_isInList.sqf";
gps_fnc_navToNearest = compileFinal preprocessFileLineNumbers "gps\fn_navToNearest.sqf";

gps_fnc_main = compileFinal preprocessFileLineNumbers "gps\fn_main.sqf";

gps_fnc_waitArrive = compileFinal preprocessFileLineNumbers "gps\fn_waitArrive.sqf";
gps_fnc_insertFakeNode = compileFinal preprocessFileLineNumbers "gps\fn_insertFakeNode.sqf";
gps_fnc_createMarker = compileFinal preprocessFileLineNumbers "gps\fn_createMarker.sqf";
gps_fnc_getAllRoads = compileFinal preprocessFileLineNumbers "gps\fn_getAllRoads.sqf";

/** TEST FUNCTIONS **/
//dev_fnc_getConnectedSegments = compileFinal preprocessFileLineNumbers "fn_getConnectedSegments.sqf";

/** GPS MENU FUNCTIONS **/
gps_menu_fnc_loadGPSMenu =  compileFinal preprocessFileLineNumbers "menu\fn_loadGPSMenu.sqf";
gps_menu_fnc_setGPSInfo = compileFinal preprocessFileLineNumbers "menu\fn_setGPSInfo.sqf"; // = update
gps_menu_fnc_gpsHelp = compileFinal preprocessFileLineNumbers "menu\fn_gpsHelp.sqf";
gps_menu_fnc_updateSavedList = compileFinal preprocessFileLineNumbers "menu\fn_updateSavedList.sqf";
gps_menu_fnc_runHud = compileFinal preprocessFileLineNumbers "menu\fn_runHud.sqf";
gps_menu_fnc_loadHud = compileFinal preprocessFileLineNumbers "menu\fn_loadHud.sqf";
gps_menu_fnc_loadQuickNav = compileFinal preprocessFileLineNumbers "menu\fn_loadQuickNav.sqf";
gps_menu_fnc_handleQuickNavActions = compileFinal preprocessFileLineNumbers "menu\fn_handleQuickNavActions.sqf";

/** MISCELLANEOUS FUNCTIONS **/
misc_fnc_createMarker = compileFinal preprocessFileLineNumbers "misc\fn_createmarker.sqf";
misc_fnc_deleteAllMarkers = compileFinal preprocessFileLineNumbers "misc\fn_deleteAllMarkers.sqf";
misc_fnc_nearestPos = compileFinal preprocessFileLineNumbers "misc\fn_nearestPos.sqf";
misc_fnc_farestPos = compileFinal preprocessFileLineNumbers "misc\fn_farestPos.sqf";
misc_fnc_nearestLocation = compileFinal preprocessFileLineNumbers "misc\fn_nearestLocation.sqf";
misc_fnc_stackedEventHandlerExists = compileFinal preprocessFileLineNumbers "misc\fn_stackedEventHandlerExists.sqf";
misc_fnc_editDialog = compileFinal preprocessFileLineNumbers "misc\fn_editDialog.sqf";
misc_fnc_pushFront = compileFinal preprocessFileLineNumbers "misc\fn_pushFront.sqf";
misc_fnc_nearestRoadInArray = compileFinal preprocessFileLineNumbers "misc\fn_nearestRoadInArray.sqf";

misc_fnc_localize = compileFinal preprocessFileLineNumbers "misc\fn_localize.sqf";
misc_fnc_getSetting = compileFinal preprocessFileLineNumbers "misc\fn_getSetting.sqf";
misc_fnc_setSetting = compileFinal preprocessFileLineNumbers "misc\fn_setSetting.sqf";

misc_fnc_hashTable_find = compileFinal preprocessFileLineNumbers "misc\hashTable\fn_find.sqf";
misc_fnc_hashTable_set = compileFinal preprocessFileLineNumbers "misc\hashTable\fn_set.sqf";
misc_fnc_hashTable_create = compileFinal preprocessFileLineNumbers "misc\hashTable\fn_create.sqf";

misc_fnc_relDirTo =  compileFinal preprocessFileLineNumbers "misc\fn_relDirTo.sqf";
misc_fnc_averageFromAngles = compileFinal preprocessFileLineNumbers	"misc\fn_averageFromAngles.sqf";

if(isNil {profileNamespace getVariable "gps_saved"}) then {  // to store path nodes position
	profileNamespace setVariable ["gps_saved",[]];
};
if(isNil {profileNamespace getVariable "gps_settings"}) then {
	profileNamespace setVariable ["gps_settings",[
		["lang","en"],
		["markers_color","colorBlue"]
	]];
};

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

gps_init_done = true;

player addAction ["GPS",gps_menu_fnc_loadGPSMenu];
(findDisplay 46) displayAddEventHandler ["KeyDown",gps_menu_fnc_handleQuickNavActions];