#include "..\macros.h"
/**
  @Author : [Utopia] Amaury
  @Creation : 22/10/17
  @Modified : 22/10/17
  @Description : procedure to create profile options if they not exist
**/


if(isNil {profileNamespace getVariable "gps_saved"}) then {  // to store path nodes position
	profileNamespace setVariable ["gps_saved",[]];
};
if(isNil {profileNamespace getVariable "gps_settings"}) then {
	profileNamespace setVariable ["gps_settings",[
		["lang",
			["default_language"] call gps_fnc_getConfigSetting
		],
		["markers_color",
			["default_marker_color"] call gps_fnc_getConfigSetting
		]
	]];
};
