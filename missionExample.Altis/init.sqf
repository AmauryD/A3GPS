/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 4/02/17
	@Description : Initialisation
**/

/** GPS FUNCTIONS  **/
gps_fnc_mapRoutes = compileFinal preprocessFileLineNumbers "gps\fn_mapRoutes.sqf";
gps_fnc_gpsAlgo = compileFinal preprocessFileLineNumbers "gps\fn_gpsAlgo.sqf";
gps_fnc_setNodeWeight = compileFinal preprocessFileLineNumbers "gps\fn_setNodeWeight.sqf";
gps_fnc_getNodeWeight = compileFinal preprocessFileLineNumbers "gps\fn_getNodeWeight.sqf";
gps_fnc_setNodePassedBy = compileFinal preprocessFileLineNumbers "gps\fn_setNodePassedBy.sqf";
gps_fnc_wasNodeChecked = compileFinal preprocessFileLineNumbers "gps\fn_wasNodeChecked.sqf";
gps_fnc_getWeakestNode = compileFinal preprocessFileLineNumbers "gps\fn_getWeakestNode.sqf";
gps_fnc_nodeAssignPredecessor = compileFinal preprocessFileLineNumbers "gps\fn_nodeAssignPredecessor.sqf";
gps_fnc_getPredecessor = compileFinal preprocessFileLineNumbers "gps\fn_getPredecessor.sqf";
gps_fnc_roadsConnectedTo = compileFinal preprocessFileLineNumbers "gps\fn_roadsConnectedTo.sqf";
gps_fnc_loadSavedPath = compileFinal preprocessFileLineNumbers "gps\fn_loadSavedPath.sqf";
gps_fnc_deletePathHelpers =  compileFinal preprocessFileLineNumbers "gps\fn_deletePathHelpers.sqf";
gps_fnc_generatePathHelpers = compileFinal preprocessFileLineNumbers "gps\fn_generatePathHelpers.sqf";

/** TEST FUNCTIONS **/
//dev_fnc_getConnectedSegments = compileFinal preprocessFileLineNumbers "fn_getConnectedSegments.sqf";

/** GPS MENU FUNCTIONS **/
gps_menu_fnc_loadGPSMenu =  compileFinal preprocessFileLineNumbers "menu\fn_loadGPSMenu.sqf";
gps_menu_fnc_setGPSInfo = compileFinal preprocessFileLineNumbers "menu\fn_setGPSInfo.sqf"; // = update
gps_menu_fnc_gpsHelp = compileFinal preprocessFileLineNumbers "menu\fn_gpsHelp.sqf";
gps_menu_fnc_updateSavedList = compileFinal preprocessFileLineNumbers "menu\fn_updateSavedList.sqf";

/** MISCELLANEOUS FUNCTIONS **/
misc_fnc_createMarker = compileFinal preprocessFileLineNumbers "misc\fn_createmarker.sqf";
misc_fnc_deleteAllMarkers = compileFinal preprocessFileLineNumbers "misc\fn_deleteAllMarkers.sqf";
misc_fnc_nearestPos = compileFinal preprocessFileLineNumbers "misc\fn_nearestPos.sqf";
misc_fnc_nearestLocation = compileFinal preprocessFileLineNumbers "misc\fn_nearestLocation.sqf";
misc_fnc_stackedEventHandlerExists = compileFinal preprocessFileLineNumbers "misc\fn_stackedEventHandlerExists.sqf";
misc_fnc_editDialog = compileFinal preprocessFileLineNumbers "misc\fn_editDialog.sqf";

if(isNil {profileNamespace getVariable "gps_saved"}) then {  // to store path nodes position
	profileNamespace setVariable ["gps_saved",[]];
};
if(isNil {profileNamespace getVariable "gps_settings"}) then {
	profileNamespace setVariable ["gps_settings",[
		["markers_color","colorBlue"],
		["objects_color","Sign_Arrow_Direction_Blue_F"]
	]];
};

gps_saveCurrent = false;
gps_local_markers =	[];
gps_local_objects = [];
gps_curr_thread = scriptNull;
gps_status_text = "Pas de status";

waitUntil {!isNull findDisplay 46};

_handle = [] spawn gps_fnc_mapRoutes; 

waitUntil {	//wait for the virtual mapping to be done
   scriptDone _handle
};

//gps_menu_fnc_loadGPSMenu
