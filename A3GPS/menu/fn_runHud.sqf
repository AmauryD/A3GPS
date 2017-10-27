#include "..\macros.h"
/**
	@Author : [Utopia] Amaury
	@Creation : 16/05/17
	@Modified : 23/10/17
	@Description : nothing to say
**/

disableSerialization;

if(!isNull (uiNamespace getVariable ["gps_hud",displayNull])) exitWith {};

("gps_hud" call BIS_fnc_rscLayer) cutRsc ["gps_hud","PLAIN", 1 , false]; //show

_hudDisplay = uiNamespace getVariable ["gps_hud",displayNull];

_map = _hudDisplay displayCtrl 2200;
_text = _hudDisplay displayCtrl 1000;
_header_dir = _hudDisplay displayCtrl 1101;
_header_grid = _hudDisplay displayCtrl 1102;
_header_time = _hudDisplay displayCtrl 1103;
_backGround = _hudDisplay displayCtrl 2201;

_map mapCenterOnCamera true;

_map ctrlAddEventHandler ["Draw",{
	_map = _this select 0;
	_vehPlayer = vehicle player;
	_speed = speed _vehPlayer;
	_map drawIcon [
		getText (configFile/"CfgVehicles"/typeOf _vehPlayer/"Icon"),
		[1,1,1,1],
        visiblePosition _vehPlayer,
        24,
        24,
        0
	];
	_map ctrlMapAnimAdd [0,(0.02 max (_speed / 1000)) min 0.5,visiblePosition _vehPlayer];
	ctrlMapAnimCommit _map;
}];


{
	_x ctrlSetPosition (_x getVariable "originalPos");
	_x ctrlCommit 1;
}foreach [_map,_text,_backGround,_header_dir,_header_time,_header_grid];

uiSleep 1;

while {!(scriptDone gps_curr_thread)} do {
	_hour = floor daytime;
	_minute = floor ((daytime - _hour) * 60);
	_second = floor (((((daytime) - (_hour))*60) - _minute)*60);

	if(_minute < 10) then {_minute = "0" + str _minute};
	if(_second < 10) then {_second = "0" + str _second};
	if(_hour < 10) then {_hour = "0" + str _hour};

	_time24 = format ["%1:%2:%3",_hour,_minute,_second];

	_dirStr = str (round getDir player);
	_dir = switch (count _dirStr) do { 
		case 1 : {  "00"+ _dirStr }; 
		case 2 : {  "0" + _dirStr }; 
		case 3 : {	_dirStr };
	};

	if(getNumber (gps_config_entry >> "hud_azimuth_enabled") == 1) then {
			_header_dir ctrlSetStructuredText parseText format["<t valign='bottom' size='0.8'><img image='%1'/>%2</t>","A3\ui_f\data\GUI\Rsc\RscDisplayIntel\azimuth_ca.paa",_dir];
	};
	if(getNumber (gps_config_entry >> "hud_gridpos_enabled") == 1) then {
			_header_grid ctrlSetStructuredText parseText format["<t valign='bottom' size='0.8'><img image='%1'/>%2</t>","A3\ui_f\data\IGUI\Cfg\simpleTasks\types\map_ca.paa",format["%1,%2",(mapGridPosition player) select [0,3],(mapGridPosition player) select [3,6]]];
	};
	if(getNumber (gps_config_entry >> "hud_clock_enabled") == 1) then {
			_header_time ctrlSetStructuredText parseText format["<t valign='bottom' size='0.8'><img image='%1'/>%2</t>","A3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa",_time24];
	};
	_text ctrlSetStructuredText parseText format["<t size='0.8'>%1</t>",gps_status_text];
};


{
	_pos = ctrlPosition _x;
	_x ctrlSetPosition [_pos select 0,_pos select 1,0,_pos select 3];
	_x ctrlCommit 1;
}foreach [_map,_text,_backGround,_header_dir,_header_time,_header_grid];

uiSleep 1;

("gps_hud" call BIS_fnc_rscLayer) cutText ["","PLAIN"];