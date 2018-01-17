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

_lang = [_settings,"lang"] call bis_fnc_getFromPairs;
_default = ["default_lang","en"] call gps_fnc_getConfigSetting;

if (isNil "_lang") then {
	[_settings,"lang",_default] call bis_fnc_setToPairs;
}else{
	if !(_lang isEqualType _default) then {
		[_settings,"lang",_default] call bis_fnc_setToPairs;
	};
};

_markersColors = [_settings,"marker_color"] call bis_fnc_getFromPairs;
_default = ["default_marker_color",[0,0,0,0]] call gps_fnc_getConfigSetting;

if (isNil "_markersColors") then {
	[_settings,"marker_color",_default] call bis_fnc_setToPairs;
}else{
	if !(_markersColors isEqualType _default) then {
		[_settings,"marker_color",_default] call bis_fnc_setToPairs;
	};
};

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

