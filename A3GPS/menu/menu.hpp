

class GPS_menu {
	idd = 369852;
	class controlsBackground {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by AmauryD, v1.063, #Kehusi)
		////////////////////////////////////////////////////////
		class main_background: IGUIBack
		{
			idc = 2201;
			x = 0.332676 * safezoneW + safezoneX;
			y = 0.296 * safezoneH + safezoneY;
			w = 0.334647 * safezoneW;
			h = 0.357 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
	class controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by AmauryD, v1.063, #Nuriso)
		////////////////////////////////////////////////////////
		class gps_bottom: RscPicture
		{
			idc = 1201;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_B_ca.paa";
			x = 0.340644 * safezoneW + safezoneX;
			y = 0.619 * safezoneH + safezoneY;
			w = 0.318712 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class gps_corner_up_left: RscPicture
		{
			idc = 1206;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_TL_ca.paa";
			x = 0.324709 * safezoneW + safezoneX;
			y = 0.279 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class gps_left: RscPicture
		{
			idc = 1205;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_L_ca.paa";
			x = 0.324709 * safezoneW + safezoneX;
			y = 0.33 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.306 * safezoneH;
		};
		class gps_corner_down_left: RscPicture
		{
			idc = 1208;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_BL_ca.paa";
			x = 0.324709 * safezoneW + safezoneX;
			y = 0.619 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class gps_bottom_right: RscPicture
		{
			idc = 1212;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_BR_ca.paa";
			x = 0.651388 * safezoneW + safezoneX;
			y = 0.619 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class gps_right: RscPicture
		{
			idc = 1213;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_R_ca.paa";
			x = 0.651388 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.306 * safezoneH;
		};
		class gps_top_right: RscPicture
		{
			idc = 1214;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_TR_ca.paa";
			x = 0.651388 * safezoneW + safezoneX;
			y = 0.279 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class gps_top: RscPicture
		{
			idc = 1215;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_T_ca.paa";
			x = 0.340644 * safezoneW + safezoneX;
			y = 0.279 * safezoneH + safezoneY;
			w = 0.318712 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class btn_nav: gps_rscbuttonMain
		{
			idc = 2400;

			text = "<img size='2.2' image='A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\map_ca.paa' align='center'/>"; //--- ToDo: Localize;
			x = 0.364548 * safezoneW + safezoneX;
			y = 0.432 * safezoneH + safezoneY;
			w = 0.0557745 * safezoneW;
			h = 0.085 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
		};
		class btn_options: gps_rscbuttonMain
		{
			idc = 2401;

			text = "<img size='2.2' image='A3\ui_f\data\GUI\Rsc\RscDisplayMain\menu_options_ca.paa' align='center'/>"; //--- ToDo: Localize;
			x = 0.436258 * safezoneW + safezoneX;
			y = 0.432 * safezoneH + safezoneY;
			w = 0.0557745 * safezoneW;
			h = 0.085 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
		};
		class btn_help: gps_rscbuttonMain
		{
			idc = 2402;

			text = "<t size='2.2' align='center'>?</t>"; //--- ToDo: Localize;
			x = 0.507968 * safezoneW + safezoneX;
			y = 0.432 * safezoneH + safezoneY;
			w = 0.0557745 * safezoneW;
			h = 0.085 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
		};
		class header: RscText
		{
			idc = 1004;

			text = "GPS MENU"; //--- ToDo: Localize;
			x = 0.35658 * safezoneW + safezoneX;
			y = 0.33 * safezoneH + safezoneY;
			w = 0.278873 * safezoneW;
			h = 0.068 * safezoneH;
			sizeEx = 2 * GUI_GRID_H;
		};
		class btn_quit: gps_rscbuttonMain
		{
			idc = 2403;

			text = "<img size='2' image='A3\ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_exit_ca.paa' align='center'/>"; //--- ToDo: Localize;
			x = 0.579678 * safezoneW + safezoneX;
			y = 0.432 * safezoneH + safezoneY;
			w = 0.0557745 * safezoneW;
			h = 0.085 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
		};
		class save_current : gps_rscbuttonMain
		{
			idc = 2405;

			text = "<img size='2.2' image='A3\ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_save_ca.paa' align='center'/>"; //--- ToDo: Localize;
			x = 0.404386 * safezoneW + safezoneX;
			y = 0.534 * safezoneH + safezoneY;
			w = 0.0557745 * safezoneW;
			h = 0.085 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
		};
		class kill_gps : gps_rscbuttonMain
		{
			idc = 2404;

			text = "<img size='2.2' image='A3\ui_f\data\IGUI\Cfg\MPTable\killed_ca.paa' align='center'/>"; //--- ToDo: Localize;
			x = 0.539839 * safezoneW + safezoneX;
			y = 0.534 * safezoneH + safezoneY;
			w = 0.0557745 * safezoneW;
			h = 0.085 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};


class gps_menu_map {
	idd = 369853;
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT START (by AmauryD, v1.063, #Vegygo)
	////////////////////////////////////////////////////////
	class controlsBackground {
		class map: RscMapControl {
			idc = 2201;

			x = 0.332676 * safezoneW + safezoneX;
			y = 0.296 * safezoneH + safezoneY;
			w = 0.334647 * safezoneW;
			h = 0.357 * safezoneH;
		};
		class background_saved: IGUIBack
		{
			idc = 2200;
			x = 0.691227 * safezoneW + safezoneX;
			y = 0.296 * safezoneH + safezoneY;
			w = 0.135452 * safezoneW;
			h = 0.357 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
		};
	};
	class controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by AmauryD, v1.063, #Dimemo)
		////////////////////////////////////////////////////////
		class gps_bottom: RscPicture
		{
			idc = 1201;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_B_ca.paa";
			x = 0.340644 * safezoneW + safezoneX;
			y = 0.619 * safezoneH + safezoneY;
			w = 0.318712 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class gps_corner_up_left: RscPicture
		{
			idc = 1206;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_TL_ca.paa";
			x = 0.324709 * safezoneW + safezoneX;
			y = 0.279 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class gps_left: RscPicture
		{
			idc = 1205;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_L_ca.paa";
			x = 0.324709 * safezoneW + safezoneX;
			y = 0.33 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.306 * safezoneH;
		};
		class gps_corner_down_left: RscPicture
		{
			idc = 1208;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_BL_ca.paa";
			x = 0.324709 * safezoneW + safezoneX;
			y = 0.619 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class gps_bottom_right: RscPicture
		{
			idc = 1212;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_BR_ca.paa";
			x = 0.651388 * safezoneW + safezoneX;
			y = 0.619 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class gps_right: RscPicture
		{
			idc = 1213;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_R_ca.paa";
			x = 0.651388 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.306 * safezoneH;
		};
		class gps_top_right: RscPicture
		{
			idc = 1214;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_TR_ca.paa";
			x = 0.651388 * safezoneW + safezoneX;
			y = 0.279 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class gps_top: RscPicture
		{
			idc = 1215;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_T_ca.paa";
			x = 0.340644 * safezoneW + safezoneX;
			y = 0.279 * safezoneH + safezoneY;
			w = 0.318712 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class RscPicture_1208: RscPicture
		{
			idc = 1205;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_L_ca.paa";
			x = 0.683259 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.306 * safezoneH;
		};
		class RscPicture_1209: RscPicture
		{
			idc = 1213;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_R_ca.paa";
			x = 0.810744 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.306 * safezoneH;
		};
		class RscPicture_1210: RscPicture
		{
			idc = 1201;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_B_ca.paa";
			x = 0.699195 * safezoneW + safezoneX;
			y = 0.619 * safezoneH + safezoneY;
			w = 0.119517 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class RscPicture_1211: RscPicture
		{
			idc = 1208;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_BL_ca.paa";
			x = 0.683259 * safezoneW + safezoneX;
			y = 0.619 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class RscPicture_1212: RscPicture
		{
			idc = 1212;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_BR_ca.paa";
			x = 0.810744 * safezoneW + safezoneX;
			y = 0.619 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class RscPicture_1213: RscPicture
		{
			idc = 1206;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_TL_ca.paa";
			x = 0.683259 * safezoneW + safezoneX;
			y = 0.279 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class RscPicture_1214: RscPicture
		{
			idc = 1214;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_TR_ca.paa";
			x = 0.810744 * safezoneW + safezoneX;
			y = 0.279 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class RscPicture_1215: RscPicture
		{
			idc = 1215;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_T_ca.paa";
			x = 0.699195 * safezoneW + safezoneX;
			y = 0.279 * safezoneH + safezoneY;
			w = 0.119517 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class saved_paths: RscListbox
		{
			idc = 1500;
			x = 0.699195 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.119517 * safezoneW;
			h = 0.200 * safezoneH;
			sizeEx = 0.9 * GUI_GRID_H;
		};
		class exec_saved: RscButton
		{
			idc = 1600;
			x = 0.707162 * safezoneW + safezoneX;
			y = 0.520 * safezoneH + safezoneY;
			w = 0.103581 * safezoneW;
			h = 0.035 * safezoneH;
		};
		class delete_saved: RscButton
		{
			idc = 1601;
			x = 0.707162 * safezoneW + safezoneX;
			y = 0.578 * safezoneH + safezoneY;
			w = 0.103581 * safezoneW;
			h = 0.035 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class gps_menu_options {
	idd = 369854;
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT START (by AmauryD, v1.063, #Vegygo)
	////////////////////////////////////////////////////////
	class controlsBackground {
		class main_background: IGUIBack
		{
			idc = 2201;

			x = 0.332676 * safezoneW + safezoneX;
			y = 0.296 * safezoneH + safezoneY;
			w = 0.334647 * safezoneW;
			h = 0.357 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.6};
		};
	};
	class controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by AmauryD, v1.063, #Bohuwe)
		////////////////////////////////////////////////////////
		class gps_bottom: RscPicture
		{
			idc = 1201;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_B_ca.paa";
			x = 0.340644 * safezoneW + safezoneX;
			y = 0.619 * safezoneH + safezoneY;
			w = 0.318712 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class gps_corner_up_left: RscPicture
		{
			idc = 1206;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_TL_ca.paa";
			x = 0.324709 * safezoneW + safezoneX;
			y = 0.279 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class gps_left: RscPicture
		{
			idc = 1205;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_L_ca.paa";
			x = 0.324709 * safezoneW + safezoneX;
			y = 0.33 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.306 * safezoneH;
		};
		class gps_corner_down_left: RscPicture
		{
			idc = 1208;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_BL_ca.paa";
			x = 0.324709 * safezoneW + safezoneX;
			y = 0.619 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class gps_bottom_right: RscPicture
		{
			idc = 1212;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_BR_ca.paa";
			x = 0.651388 * safezoneW + safezoneX;
			y = 0.619 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class gps_right: RscPicture
		{
			idc = 1213;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_R_ca.paa";
			x = 0.651388 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.306 * safezoneH;
		};
		class gps_top_right: RscPicture
		{
			idc = 1214;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_TR_ca.paa";
			x = 0.651388 * safezoneW + safezoneX;
			y = 0.279 * safezoneH + safezoneY;
			w = 0.0239034 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class gps_top: RscPicture
		{
			idc = 1215;

			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_T_ca.paa";
			x = 0.340644 * safezoneW + safezoneX;
			y = 0.279 * safezoneH + safezoneY;
			w = 0.318712 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class lang_list: RscCombo
		{
			idc = 2100;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.347 * safezoneH + safezoneY;
			w = 0.111549 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class language_txt: RscText
		{
			idc = 1001;
			text = "Lang"; //--- ToDo: Localize;
			x = 0.35658 * safezoneW + safezoneX;
			y = 0.347 * safezoneH + safezoneY;
			w = 0.135452 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class markers_colors_txt: RscText
		{
			idc = 1000;
			text = "Mark colors"; //--- ToDo: Localize;
			x = 0.35658 * safezoneW + safezoneX;
			y = 0.398 * safezoneH + safezoneY;
			w = 0.135452 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class colors_list: RscCombo
		{
			idc = 2101;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.398 * safezoneH + safezoneY;
			w = 0.111549 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class drop_data_btn: RscButton
		{
			idc = 1600;
			text = "DROP DATA"; //--- ToDo: Localize;
			x = 0.35658 * safezoneW + safezoneX;
			y = 0.585 * safezoneH + safezoneY;
			w = 0.0956135 * safezoneW;
			h = 0.034 * safezoneH;
			colorText[] = {0.8,0,0,1};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

