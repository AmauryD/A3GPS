/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 4/02/17
	@Description : update the GPS menu and if not open set the gps status var
**/

private _text = param [0,"",[""]];

gps_status_text = _text;

if(!isNull findDisplay 369852) then {
	disableSerialization;

	_display = findDisplay 369852;
	_status_text = _display displayCtrl 1001;
	
	_status_text ctrlSetText gps_status_text;
};