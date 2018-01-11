// GPS borders here
#define GPS_BASE  class gps_bottom: A3GPS_RSCPICTURE { idc = 1201; text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_B_ca.paa"; x = 0.332657 * safezoneW + safezoneX; y = 0.653 * safezoneH + safezoneY; w = 0.334688 * safezoneW; h = 0.051 * safezoneH; }; class gps_corner_up_left: A3GPS_RSCPICTURE { idc = 1206; text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_TL_ca.paa"; x = 0.30875 * safezoneW + safezoneX; y = 0.245 * safezoneH + safezoneY; w = 0.0239034 * safezoneW; h = 0.051 * safezoneH; }; class gps_left: A3GPS_RSCPICTURE { idc = 1205; text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_L_ca.paa"; x = 0.308747 * safezoneW + safezoneX; y = 0.296 * safezoneH + safezoneY; w = 0.0239062 * safezoneW; h = 0.357 * safezoneH; }; class gps_corner_down_left: A3GPS_RSCPICTURE { idc = 1208; text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_BL_ca.paa"; x = 0.30875 * safezoneW + safezoneX; y = 0.653 * safezoneH + safezoneY; w = 0.0239062 * safezoneW; h = 0.051 * safezoneH; }; class gps_bottom_right: A3GPS_RSCPICTURE { idc = 1212; text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_BR_ca.paa"; x = 0.667344 * safezoneW + safezoneX; y = 0.653 * safezoneH + safezoneY; w = 0.0239034 * safezoneW; h = 0.051 * safezoneH; }; class gps_right: A3GPS_RSCPICTURE { idc = 1213; text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_R_ca.paa"; x = 0.667344 * safezoneW + safezoneX; y = 0.296 * safezoneH + safezoneY; w = 0.0239062 * safezoneW; h = 0.357 * safezoneH; }; class gps_top_right: A3GPS_RSCPICTURE { idc = 1214; text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_TR_ca.paa"; x = 0.667344 * safezoneW + safezoneX; y = 0.245 * safezoneH + safezoneY; w = 0.0239034 * safezoneW; h = 0.051 * safezoneH; }; class gps_top: A3GPS_RSCPICTURE { idc = 1215; text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_T_ca.paa"; x = 0.332618 * safezoneW + safezoneX; y = 0.245 * safezoneH + safezoneY; w = 0.334688 * safezoneW; h = 0.051 * safezoneH; }

class GPS_menu {
	idd = 369852;
	class controlsBackground {
		class main_background: A3GPS_IGUIBack
		{
			idc = 2201;

			x = 0.324667 * safezoneW + safezoneX;
			y = 0.279 * safezoneH + safezoneY;
			w = 0.350625 * safezoneW;
			h = 0.391 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
		};
	};
	class controls {
		GPS_BASE;
		class btn_nav: A3GPS_RscbuttonMain
		{
			idc = 2400;
			size = 0.09;

			text = "<img image='A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\map_ca.paa' align='center'/>"; //--- ToDo: Localize;
			x = 0.364531 * safezoneW + safezoneX;
			y = 0.398 * safezoneH + safezoneY;
			w = 0.0557745 * safezoneW;
			h = 0.085 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
		};
		class btn_options: A3GPS_RscbuttonMain
		{
			idc = 2401;
			size = 0.09;

			text = "<img image='A3\ui_f\data\GUI\Rsc\RscDisplayMain\menu_options_ca.paa' align='center'/>"; //--- ToDo: Localize;
			x = 0.43625 * safezoneW + safezoneX;
			y = 0.398 * safezoneH + safezoneY;
			w = 0.0557745 * safezoneW;
			h = 0.085 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
		};
		class btn_help: A3GPS_RscbuttonMain
		{
			idc = 2402;
			size = 0.09;

			text = "<t align='center'>?</t>"; //--- ToDo: Localize;
			x = 0.507969 * safezoneW + safezoneX;
			y = 0.398 * safezoneH + safezoneY;
			w = 0.0557745 * safezoneW;
			h = 0.085 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
		};
		class header: A3GPS_RscText
		{
			idc = 1004;

			text = "GPS MENU"; //--- ToDo: Localize;
			x = 0.332656 * safezoneW + safezoneX;
			y = 0.296 * safezoneH + safezoneY;
			w = 0.334688 * safezoneW;
			h = 0.068 * safezoneH;
			sizeEx = 2 * GUI_GRID_H;
		};
		class btn_quit: A3GPS_RscbuttonMain
		{
			idc = 2403;
			size = 0.09;

			text = "<img image='A3\ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_ca.paa' align='center'/>"; //--- ToDo: Localize;
			x = 0.579687 * safezoneW + safezoneX;
			y = 0.398 * safezoneH + safezoneY;
			w = 0.0557745 * safezoneW;
			h = 0.085 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
		};
		class save_current: A3GPS_RscbuttonMain
		{
			idc = 2405;
			size = 0.09;

			text = "<img image='A3\ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_save_ca.paa' align='center'/>"; //--- ToDo: Localize;
			x = 0.388437 * safezoneW + safezoneX;
			y = 0.534 * safezoneH + safezoneY;
			w = 0.0557745 * safezoneW;
			h = 0.085 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
		};
		class kill_gps: A3GPS_RscbuttonMain
		{
			idc = 2404;
			size = 0.09;

			text = "<img image='A3\ui_f\data\IGUI\Cfg\MPTable\killed_ca.paa' align='center'/>"; //--- ToDo: Localize;
			x = 0.547812 * safezoneW + safezoneX;
			y = 0.534 * safezoneH + safezoneY;
			w = 0.0557745 * safezoneW;
			h = 0.085 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
		};
		class controls_btn: A3GPS_RscbuttonMain
		{
			idc = 2406;
			size = 0.09;

			text = "<img image='A3\ui_f\data\IGUI\Cfg\CommandBar\imageCommander_ca.paa' align='center'/>"; //--- ToDo: Localize;
			x = 0.468125 * safezoneW + safezoneX;
			y = 0.534 * safezoneH + safezoneY;
			w = 0.0557745 * safezoneW;
			h = 0.085 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
		};
	};
};


class gps_menu_map {
	idd = 369853;
	class controlsBackground {
		class map: A3GPS_RscMapControl {
			idc = 2201;

			x = 0.324667 * safezoneW + safezoneX;
			y = 0.279 * safezoneH + safezoneY;
			w = 0.350625 * safezoneW;
			h = 0.391 * safezoneH;
		};
		class background_saved: A3GPS_IGUIBack
		{
			idc = 2200;

			x = 0.715156 * safezoneW + safezoneX;
			y = 0.279 * safezoneH + safezoneY;
			w = 0.135469 * safezoneW;
			h = 0.391 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
		};
	};
	class controls {
		GPS_BASE;
		class RscPicture_1208: A3GPS_RscPicture
		{
			idc = 1205;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_L_ca.paa"; //--- ToDo: Localize;
			x = 0.699216 * safezoneW + safezoneX;
			y = 0.279 * safezoneH + safezoneY;
			w = 0.0239062 * safezoneW;
			h = 0.374 * safezoneH;
		};
		class RscPicture_1209: A3GPS_RscPicture
		{
			idc = 1213;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_R_ca.paa"; //--- ToDo: Localize;
			x = 0.842656 * safezoneW + safezoneX;
			y = 0.279 * safezoneH + safezoneY;
			w = 0.0239062 * safezoneW;
			h = 0.374 * safezoneH;
		};
		class RscPicture_1210: A3GPS_RscPicture
		{
			idc = 1201;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_B_ca.paa"; //--- ToDo: Localize;
			x = 0.715156 * safezoneW + safezoneX;
			y = 0.653 * safezoneH + safezoneY;
			w = 0.1275 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class RscPicture_1211: A3GPS_RscPicture
		{
			idc = 1208;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_BL_ca.paa"; //--- ToDo: Localize;
			x = 0.699219 * safezoneW + safezoneX;
			y = 0.653 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class RscPicture_1212: A3GPS_RscPicture
		{
			idc = 1212;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_BR_ca.paa"; //--- ToDo: Localize;
			x = 0.842656 * safezoneW + safezoneX;
			y = 0.653 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class RscPicture_1213: A3GPS_RscPicture
		{
			idc = 1206;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_TL_ca.paa"; //--- ToDo: Localize;
			x = 0.699219 * safezoneW + safezoneX;
			y = 0.245 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class RscPicture_1214: A3GPS_RscPicture
		{
			idc = 1214;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_TR_ca.paa"; //--- ToDo: Localize;
			x = 0.842656 * safezoneW + safezoneX;
			y = 0.245 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class RscPicture_1215: A3GPS_RscPicture
		{
			idc = 1215;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_T_ca.paa"; //--- ToDo: Localize;
			x = 0.723125 * safezoneW + safezoneX;
			y = 0.245 * safezoneH + safezoneY;
			w = 0.1275 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class saved_paths: A3GPS_RscListBox
		{
			idc = 1500;

			x = 0.723111 * safezoneW + safezoneX;
			y = 0.296 * safezoneH + safezoneY;
			w = 0.119531 * safezoneW;
			h = 0.238 * safezoneH;
		};
		class exec_saved: A3GPS_RscButton
		{
			idc = 1600;

			x = 0.731094 * safezoneW + safezoneX;
			y = 0.602 * safezoneH + safezoneY;
			w = 0.103581 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class delete_saved: A3GPS_RscButton
		{
			idc = 1601;

			x = 0.731094 * safezoneW + safezoneX;
			y = 0.551 * safezoneH + safezoneY;
			w = 0.103581 * safezoneW;
			h = 0.035 * safezoneH;
		};
	};
};

class gps_menu_options {
	idd = 369854;
	class controlsBackground {
		class main_background: A3GPS_IGUIBack
		{
			idc = 2201;

			x = 0.324667 * safezoneW + safezoneX;
			y = 0.279 * safezoneH + safezoneY;
			w = 0.350625 * safezoneW;
			h = 0.391 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
		};
	};
	class controls {
		GPS_BASE;
		class lang_list: A3GPS_RscCombo
		{
			idc = 2100;

			x = 0.492031 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.111549 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class language_txt: A3GPS_RscText
		{
			idc = 1001;

			text = "Lang"; //--- ToDo: Localize;
			x = 0.340625 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.135452 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class markers_colors_txt: A3GPS_RscText
		{
			idc = 1000;

			text = "Mark colors"; //--- ToDo: Localize;
			x = 0.340625 * safezoneW + safezoneX;
			y = 0.364 * safezoneH + safezoneY;
			w = 0.135452 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class colors: A3GPS_RscbuttonMain
		{
			idc = 1601;

			text="";
			periodFocus = 0;
			periodOver = 0;
			period = 0;
			x = 0.492031 * safezoneW + safezoneX;
			y = 0.364 * safezoneH + safezoneY;
			w = 0.111549 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class drop_data_btn: A3GPS_RscButton
		{
			idc = 1600;

			text = "DROP DATA"; //--- ToDo: Localize;
			x = 0.348594 * safezoneW + safezoneX;
			y = 0.602 * safezoneH + safezoneY;
			w = 0.0956135 * safezoneW;
			h = 0.034 * safezoneH;
			colorText[] = {0.8,0,0,1};
		};
	};
};


class gps_menu_controls {
	idd = 369855;
	class controlsBackground {
		class main_background: A3GPS_IGUIBack
		{
			idc = 2201;

			x = 0.324667 * safezoneW + safezoneX;
			y = 0.279 * safezoneH + safezoneY;
			w = 0.350625 * safezoneW;
			h = 0.391 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
		};
	};
	class controls {
		GPS_BASE;
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by AmauryD, v1.063, #Cibymi)
		////////////////////////////////////////////////////////
		class controls_list: A3GPS_RscListbox
		{
			idc = 1500;
			x = 0.340625 * safezoneW + safezoneX;
			y = 0.381 * safezoneH + safezoneY;
			w = 0.175312 * safezoneW;
			h = 0.272 * safezoneH;
		};
		class keys_list: A3GPS_RscListbox
		{
			idc = 1501;
			x = 0.523906 * safezoneW + safezoneX;
			y = 0.381 * safezoneH + safezoneY;
			w = 0.135469 * safezoneW;
			h = 0.17 * safezoneH;
		};
		class controls_header: A3GPS_RscText
		{
			idc = 1001;
			text = "Controles"; //--- ToDo: Localize;
			x = 0.340625 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.215156 * safezoneW;
			h = 0.051 * safezoneH;
			sizeEx = 1.5 * GUI_GRID_H;
		};
		class del_key_btn: A3GPS_RscButton
		{
			idc = 1600;
			text = "Supprimer la touche"; //--- ToDo: Localize;
			x = 0.523906 * safezoneW + safezoneX;
			y = 0.619 * safezoneH + safezoneY;
			w = 0.135469 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class add_key_btn: A3GPS_RscButton
		{
			idc = 1601;
			text = "Ajouter une touche"; //--- ToDo: Localize;
			x = 0.523906 * safezoneW + safezoneX;
			y = 0.568 * safezoneH + safezoneY;
			w = 0.135469 * safezoneW;
			h = 0.034 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};