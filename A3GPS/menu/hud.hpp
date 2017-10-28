/* #Gonoja
$[
	1.063,
	["gps_new",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1000,"gps_map: RscMapControl",[1,"",["-0.00204341 * safezoneW + safezoneX","0.312991 * safezoneH + safezoneY","0.183286 * safezoneW","0.238011 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,1],[-1,-1,-1,-1],"","-1"],["idc = 2200;","mapOrientation = 1;","moveOnEdges = 1;","showCountourInterval = 1;"]],
	[1001,"status_text",[1,"",["0.0218634 * safezoneW + safezoneX","0.568003 * safezoneH + safezoneY","0.159379 * safezoneW","0.0340016 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,0],[-1,-1,-1,-1],"","-1"],[]],
	[1200,"status_picture",[1,"",["0.00592555 * safezoneW + safezoneX","0.568003 * safezoneH + safezoneY","0.0159379 * safezoneW","0.0340016 * safezoneH"],[-1,-1,-1,-1],[0,0,0,0.6],[-1,-1,-1,-1],"","-1"],[]],
	[2200,"main_background",[1,"",["-0.0013608 * safezoneW + safezoneX","0.314293 * safezoneH + safezoneY","0.183286 * safezoneW","0.238011 * safezoneH"],[-1,-1,-1,-1],[0,0,0,0.6],[-1,-1,-1,-1],"","-1"],[]],
	[1201,"goal_image",[1,"A3\ui_f\data\Map\Markers\Military\flag_CA.paa",["0.00592555 * safezoneW + safezoneX","0.619005 * safezoneH + safezoneY","0.0159379 * safezoneW","0.0340016 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2202,"",[1,"",["-0.00204341 * safezoneW + safezoneX","0.568003 * safezoneH + safezoneY","0.183286 * safezoneW","0.0340016 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2203,"",[1,"",["-0.00204341 * safezoneW + safezoneX","0.619005 * safezoneH + safezoneY","0.183286 * safezoneW","0.0340016 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1002,"goal_distance",[1,"",["0.0218637 * safezoneW + safezoneX","0.619005 * safezoneH + safezoneY","0.159379 * safezoneW","0.0340016 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/


#define GUI_GRID_H (safezoneH / 25)

class gps_hud
{
	idd =987654;
	duration = 9999999;
	onLoad="_this call gps_menu_fnc_loadHud";

	class controlsBackground {
		class IGUIBack_2202: IGUIBack
		{
			idc = 2202;
			x = -0.00204341 * safezoneW + safezoneX;
			y = 0.568003 * safezoneH + safezoneY;
			w = 0.183286 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class IGUIBack_2203: IGUIBack
		{
			idc = 2203;
			x = -0.00204341 * safezoneW + safezoneX;
			y = 0.619005 * safezoneH + safezoneY;
			w = 0.183286 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class main_background: IGUIBack
		{
			idc = 2200;
			x = -0.0013608 * safezoneW + safezoneX;
			y = 0.314293 * safezoneH + safezoneY;
			w = 0.183286 * safezoneW;
			h = 0.238011 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
	};

	class controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by AmauryD, v1.063, #Gonoja)
		////////////////////////////////////////////////////////

		class gps_map: RscMapControl
		{
			idc = 2201;
			mapOrientation = 1;
			moveOnEdges = 1;
			showCountourInterval = 1;

			x = -0.00204341 * safezoneW + safezoneX;
			y = 0.312991 * safezoneH + safezoneY;
			w = 0.183286 * safezoneW;
			h = 0.238011 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
		};
		class status_text: RscText
		{
			idc = 1000;
			x = 0.0218634 * safezoneW + safezoneX;
			y = 0.568003 * safezoneH + safezoneY;
			w = 0.159379 * safezoneW;
			h = 0.0340016 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			sizeEx = 0.5 * GUI_GRID_H;
		};
		class status_picture: RscPicture
		{
			idc = 1200;
			x = 0.00592555 * safezoneW + safezoneX;
			y = 0.568003 * safezoneH + safezoneY;
			w = 0.0159379 * safezoneW;
			h = 0.0340016 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class goal_image: RscPicture
		{
			idc = 1201;
			text = "A3\ui_f\data\Map\Markers\Military\flag_CA.paa";
			x = 0.00592555 * safezoneW + safezoneX;
			y = 0.619005 * safezoneH + safezoneY;
			w = 0.0159379 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		class goal_distance: RscText
		{
			idc = 1002;
			x = 0.0218637 * safezoneW + safezoneX;
			y = 0.619005 * safezoneH + safezoneY;
			w = 0.159379 * safezoneW;
			h = 0.0340016 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};

};