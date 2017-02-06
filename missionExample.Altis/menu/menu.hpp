#include "common.hpp"

class GPS_menu {
	idd = 369852;
	class controlsBackground {
		class background: IGUIBack
		{
			idc = 2200;
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.232031 * safezoneW;
			h = 0.297 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		class gps_bottom: RscPicture
		{
			idc = 1201;
			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_B_ca.paa";
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class gps_corner_down_right: RscPicture
		{
			idc = 1202;
			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_BR_ca.paa";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class gps_right: RscPicture
		{
			idc = 1203;
			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_R_ca.paa";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.257444 * safezoneH;
		};
		class gps_top: RscPicture
		{
			idc = 1204;
			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_T_ca.paa";
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class gps_corner_up_left: RscPicture
		{
			idc = 1206;
			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_TL_ca.paa";
			x = 0.237031 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class gps_corner_up_right: RscPicture
		{
			idc = 1207;
			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_TR_ca.paa";
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class gps_left: RscPicture
		{
			idc = 1205;
			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_L_ca.paa";
			x = 0.237031 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.258556 * safezoneH;
		};
		class gps_corner_down_left: RscPicture
		{
			idc = 1208;
			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_BL_ca.paa";
			x = 0.237031 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class map: RscMapControl
		{
			idc = 2201;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.252656 * safezoneW;
			h = 0.308 * safezoneH;
		};
	};

	class controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Rasta Populos, v1.063, #Nacypy)
		///////////////////////////////////////////////////////
		class map_left: RscPicture
		{
			idc = 1200;
			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_L_ca.paa";
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.259667 * safezoneH;
		};
		class map_top_left: RscPicture
		{
			idc = 1209;
			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_TL_ca.paa";
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class map_bottom_left: RscPicture
		{
			idc = 1210;
			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_BL_ca.paa";
			x = 0.515469 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class map_bottom: RscPicture
		{
			idc = 1211;
			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_B_ca.paa";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class map_bottom_right: RscPicture
		{
			idc = 1212;
			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_BR_ca.paa";
			x = 0.757813 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class map_right: RscPicture
		{
			idc = 1213;
			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_R_ca.paa";
			x = 0.757813 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.257444 * safezoneH;
		};
		class map_top_right: RscPicture
		{
			idc = 1214;
			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_TR_ca.paa";
			x = 0.757813 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class map_top: RscPicture
		{
			idc = 1215;
			text = "\A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\gps_T_ca.paa";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class saved_path: RscListbox
		{
			idc = 1500;
			x = 0.262813 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.099 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};
		class load_saved_path: RscButton
		{
			idc = 1600;
			text = "Charger"; //--- ToDo: Localize;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};
		class status_text: RscText
		{
			idc = 1001;
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = 0.8 * GUI_GRID_H;
		};
		class new_path: RscButton
		{
			idc = 1601;
			text = "Nouveau trajet"; //--- ToDo: Localize;
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};
		class delete_saved_path: RscButton
		{
			idc = 1602;
			text = "Supprimer"; //--- ToDo: Localize;
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};
		class stop_path: RscButton
		{
			idc = 1603;
			text = "Arreter"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};
		class drop_data: RscButton
		{
			idc = 1604;
			text = "Vider le cache"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};
		class close_btn: RscButton
		{
			idc = 1605;
			text = "X"; //--- ToDo: Localize;
			x = 0.463906 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};
		class help_btn: RscButton
		{
			idc = 1606;
			text = "?"; //--- ToDo: Localize;
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};
		class RscText_1000: RscText
		{
			idc = 1000;
			text = "GPS MENU"; //--- ToDo: Localize;
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			sizeEx = 1 * GUI_GRID_H;
		};
		class color_markers: RscCombo
		{
			idc = 2100;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class color_objects: RscCombo
		{
			idc = 2101;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};