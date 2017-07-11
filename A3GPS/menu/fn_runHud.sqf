/**
	@Author : [Utopia] Amaury
	@Creation : 16/05/17
	@Modified : 18/07/17
	@Description : nothing to say
**/

disableSerialization;

("gps_hud" call BIS_fnc_rscLayer) cutRsc ["gps_hud","PLAIN", 1 , false]; //show

_hudDisplay = uiNamespace getVariable ["gps_hud",displayNull];

_map = _hudDisplay displayCtrl 2200;
_text = _hudDisplay displayCtrl 1000;
_header_dir = _hudDisplay displayCtrl 1101;
_header_grid = _hudDisplay displayCtrl 1102;
_header_time = _hudDisplay displayCtrl 1103;
_backGround = _hudDisplay displayCtrl 2201;

{
	_x ctrlSetPosition (_x getVariable "originalPos");
	_x ctrlCommit 1;
}foreach [_map,_text,_backGround,_header_dir,_header_time,_header_grid];

uiSleep 0.5;

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

	_header_dir ctrlSetStructuredText parseText format["<t valign='bottom' size='0.6'><img image='%1'/>%2</t>","A3\ui_f\data\GUI\Rsc\RscDisplayIntel\azimuth_ca.paa",_dir];
	_header_grid ctrlSetStructuredText parseText format["<t valign='bottom' size='0.6'><img image='%1'/>%2</t>","A3\ui_f\data\IGUI\Cfg\simpleTasks\types\map_ca.paa",format["%1,%2",(mapGridPosition player) select [0,3],(mapGridPosition player) select [3,6]]];
	_header_time ctrlSetStructuredText parseText format["<t valign='bottom' size='0.6'><img image='%1'/>%2</t>","A3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa",_time24];
	_text ctrlSetStructuredText parseText format["<t size='0.6'>%1</t>",gps_status_text];
	_map ctrlMapAnimAdd [0.2, (0.001 * (speed vehicle player)) max 0.05, vehicle player];
	ctrlMapAnimCommit _map;
	waitUntil {
	   ctrlMapAnimDone _map
	};
};


{
	_pos = ctrlPosition _x;
	_x ctrlSetPosition [_pos select 0,_pos select 1,0,_pos select 3];
	_x ctrlCommit 1;
}foreach [_map,_text,_backGround,_header_dir,_header_time,_header_grid];

uiSleep 1;

("gps_hud" call BIS_fnc_rscLayer) cutText ["","PLAIN"];