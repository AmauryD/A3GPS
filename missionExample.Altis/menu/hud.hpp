class gps_hud
{
	idd =987654;
	duration = 9999999;
	onLoad="_this call gps_menu_fnc_loadHud";

	class controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Impri Mante, v1.063, #Coxujo)
		////////////////////////////////////////////////////////

		class gps_map: RscMapControl
		{
			idc = 2200;
			mapOrientation = 1;
			moveOnEdges = 1;
			showCountourInterval = 1;

			x = -0.00197386 * safezoneW + safezoneX;
			y = 0.363994 * safezoneH + safezoneY;
			w = 0.159357 * safezoneW;
			h = 0.272012 * safezoneH;
		};
		class gps_status_background: IGUIBack
		{
			idc = 2201;

			x = -0.00197386 * safezoneW + safezoneX;
			y = 0.329993 * safezoneH + safezoneY;
			w = 0.159357 * safezoneW;
			h = 0.340014 * safezoneH;
		};
		class gps_status: RscStructuredText
		{
			idc = 1000;

			x = -0.00197384 * safezoneW + safezoneX;
			y = 0.636006 * safezoneH + safezoneY;
			w = 0.159357 * safezoneW;
			h = 0.0340014 * safezoneH;
			sizeEx = 0.6 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * GUI_GRID_H;
		};
		class gps_status_header_azimut: RscStructuredText
		{
			idc = 1101;

			x = -0.00197386 * safezoneW + safezoneX;
			y = 0.329993 * safezoneH + safezoneY;
			w = 0.047807 * safezoneW;
			h = 0.0340014 * safezoneH;
		};
		class gps_status_header_grid: RscStructuredText
		{
			idc = 1102;

			x = 0.0458331 * safezoneW + safezoneX;
			y = 0.329993 * safezoneH + safezoneY;
			w = 0.0557749 * safezoneW;
			h = 0.0340014 * safezoneH;
		};
		class gps_status_header_time: RscStructuredText
		{
			idc = 1103;

			x = 0.101608 * safezoneW + safezoneX;
			y = 0.329993 * safezoneH + safezoneY;
			w = 0.0557749 * safezoneW;
			h = 0.0340014 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};

};