#include "..\macros.h"
/**
  @Author : [Utopia] Amaury
  @Creation : 22/10/17
  @Modified : 22/10/17
  @Description : procedure to create profile options if they not exist
  @Return : NOTHING
**/


private _saved = profileNamespace getVariable "gps_saved";

if(isNil "_saved") then {  // to store path nodes position
	profileNameSpace setVariable ["gps_saved",[]];
}else{
	if !(_saved isEqualType []) exitWith {
		profileNameSpace setVariable ["gps_saved",[]];
		systemChat "GPS : Corrupted data were erased";
	};
};

if (isNil {profileNamespace getVariable "gps_settings"}) then {
	profileNamespace setVariable ["gps_settings",[]];
};

private _settings = profileNamespace getVariable "gps_settings";

{
	_x params ["_name","_defaultValue"];

	_value = [_settings,_name] call bis_fnc_getFromPairs;
	_default = ["default_" + _name,_defaultValue] call gps_fnc_getConfigSetting;

	if (isNil "_value") then {
		[_settings,_name,_default] call bis_fnc_setToPairs;
	}else{
		if !(_value isEqualType _default) then {
			[_settings,_name,_default] call bis_fnc_setToPairs;
		};
	};
}forEach [
	["marker_color",[0,0,0,0]],
	["lang","en"],
	["metric","km"]
];

{
	_keyID = getNumber (_x >> "default");
	_current = [_settings,configName _x,[]] call bis_fnc_getFromPairs;
	if (_current isEqualTo []) then {
		[_settings,configName _x,[_keyID]] call bis_fnc_setToPairs;
	}else{
		if !(_current isEqualType []) then {
			[_settings,configName _x,[_keyID]] call bis_fnc_setToPairs;
		};
	};
}foreach ("true" configClasses (missionConfigFile >> "CfgGPS" >> "Keys"));

