

class ac_text_dialog {
	idd = 1234567;
	class controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Rasta Populos, v1.063, #Kefasa)
		////////////////////////////////////////////////////////

		class IGUIBack_2200: A3GPS_IGUIBack
		{
			idc = 2200;

			x = 0.370165 * safezoneW + safezoneX;
			y = 0.436966 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.165 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		class text_edit: A3GPS_RscEdit
		{
			idc = 1400;

			x = 0.374871 * safezoneW + safezoneX;
			y = 0.49296 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class enter_text: A3GPS_RscText
		{
			idc = 1000;

			text = "Please enter text"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.445998 * safezoneH + safezoneY;
			w = 0.242344 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class okBtn: A3GPS_RscButton
		{
			idc = 1600;

			text = "OK"; //--- ToDo: Localize;
			x = 0.376253 * safezoneW + safezoneX;
			y = 0.552038 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class NoBtn: A3GPS_RscButton
		{
			idc = 1601;

			text = "Cancel"; //--- ToDo: Localize;
			x = 0.505672 * safezoneW + safezoneX;
			y = 0.552038 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.033 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};