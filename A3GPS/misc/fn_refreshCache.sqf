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

private _saved = profileNamespace getVariable "gps_settings";

if(isNil "_saved") then {
	profileNameSpace setVariable ["gps_settings",
	[
		["lang",
			["default_lang","en"] call gps_fnc_getConfigSetting
		],
		["marker_color",
			["default_marker_color","ColorGreen"] call gps_fnc_getConfigSetting
		],
		["quicknav_open_key",
			["default_quicknav_open_key",-1] call gps_fnc_getConfigSetting
		],
		["quicknav_switch_key",
			["default_quicknav_switch_key",-1] call gps_fnc_getConfigSetting
		],
		["quicknav_execute_key",
			["default_quicknav_execute_key",-1] call gps_fnc_getConfigSetting
		]
	]];
}else{
	{
		_val = [_saved,_x] call bis_fnc_getFromPairs;
		if (isNil "_val") then {
			[_x,
				["default_" + _x] call gps_fnc_getConfigSetting
			] call misc_fnc_setSetting;
		};
	}foreach [
		"lang",
		"markers_color",
		"quicknav_open_key",
		"quicknav_switch_key",
		"quicknav_execute_key"
	];
};