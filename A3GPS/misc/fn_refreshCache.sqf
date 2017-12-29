#include "..\macros.h"
/**
  @Author : [Utopia] Amaury
  @Creation : 22/10/17
  @Modified : 22/10/17
  @Description : procedure to create profile options if they not exist
**/


if(isNil {profileNamespace getVariable "gps_saved"}) then {  // to store path nodes position
	profileNameSpace setVariable ["gps_saved",[]];
}else{
	private _saved = profileNamespace getVariable "gps_saved";
	if !(_saved isEqualType []) exitWith {
		profileNameSpace setVariable ["gps_saved",[]];
		systemChat "GPS : Corrupted data were erased";
	};
};
if(isNil {profileNamespace getVariable "gps_settings"}) then {
	profileNameSpace setVariable ["gps_settings",
	[
		["lang",
			["default_language"] call gps_fnc_getConfigSetting
		],
		["markers_color",
			["default_marker_color"] call gps_fnc_getConfigSetting
		],
		["quicknav_open_key",
			["default_quicknav_open_key"] call gps_fnc_getConfigSetting
		],
		["quicknav_switch_key",
			["default_quicknav_switch_key"] call gps_fnc_getConfigSetting
		],
		["quicknav_execute_key",
			["default_quicknav_execute_key"] call gps_fnc_getConfigSetting
		]
	]];
};