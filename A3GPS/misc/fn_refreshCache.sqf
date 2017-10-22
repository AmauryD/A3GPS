if(isNil {profileNamespace getVariable "gps_saved"}) then {  // to store path nodes position
	profileNamespace setVariable ["gps_saved",[]];
};
if(isNil {profileNamespace getVariable "gps_settings"}) then {
	profileNamespace setVariable ["gps_settings",[
		["lang",getText	(gps_config_entry >> "default_language")],
		["markers_color",getText (gps_config_entry >> "default_marker_color")]
	]];
};
