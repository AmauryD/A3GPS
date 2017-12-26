class GPS_quickNav {
	idd = 369853;
	duration = 9999999;
	onLoad="_this call gps_menu_fnc_loadQuickNav";
	class Controls {
		class RscButton_1600: A3GPS_RscButton
		{
			idc = 1600;
			x = -0.00603843 * safezoneW + safezoneX;
			y = 0.279091 * safezoneH + safezoneY;
			w = 0.183286 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class RscStructuredText_1100: A3GPS_RscStructuredText
		{
			idc = 1100;
			text = "<t align='center'>Quick nav</t>"; //--- ToDo: Localize;
			x = -0.00610069 * safezoneW + safezoneX;
			y = 0.245 * safezoneH + safezoneY;
			w = 0.183286 * safezoneW;
			h = 0.034 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
	};
};