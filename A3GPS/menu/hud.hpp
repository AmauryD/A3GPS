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

/* #Mysowo
$[
	1.063,
	["gps_hud",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[2200,"IGUIBack_2202",[1,"",["-0.00204339 * safezoneW + safezoneX","0.568003 * safezoneH + safezoneY","0.183286 * safezoneW","0.0340016 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 2202;"]],
	[2201,"IGUIBack_2203",[1,"",["-0.00204339 * safezoneW + safezoneX","0.619005 * safezoneH + safezoneY","0.183286 * safezoneW","0.0340016 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 2203;"]],
	[1000,"gps_map: RscMapControl",[1,"",["-0.00204341 * safezoneW + safezoneX","0.312991 * safezoneH + safezoneY","0.183286 * safezoneW","0.238011 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,1],[-1,-1,-1,-1],"","-1"],["idc = 2201;","mapOrientation = 1;","moveOnEdges = 1;","showCountourInterval = 1;"]],
	[1001,"status_text",[1,"",["0.0218634 * safezoneW + safezoneX","0.568003 * safezoneH + safezoneY","0.159379 * safezoneW","0.0340016 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,0],[-1,-1,-1,-1],"","0.5 * (safezoneH / 25)"],["idc = 1000;"]],
	[1200,"status_picture",[1,"#(argb,8,8,3)color(1,1,1,1)",["0.00592555 * safezoneW + safezoneX","0.568003 * safezoneH + safezoneY","0.0159379 * safezoneW","0.0340016 * safezoneH"],[-1,-1,-1,-1],[0,0,0,0.6],[-1,-1,-1,-1],"","-1"],["idc = 1200;"]],
	[1201,"goal_image",[1,"A3\ui_f\data\Map\Markers\Military\flag_CA.paa",["0.00592555 * safezoneW + safezoneX","0.619005 * safezoneH + safezoneY","0.0159379 * safezoneW","0.0340016 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 1201;"]],
	[1002,"goal_distance",[1,"",["0.0218634 * safezoneW + safezoneX","0.619005 * safezoneH + safezoneY","0.159379 * safezoneW","0.0340016 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],["idc = 1002;"]],
	[1003,"zoomMap : RscMapControl",[1,"",["0.189211 * safezoneW + safezoneX","0.551002 * safezoneH + safezoneY","0.0557826 * safezoneW","0.102005 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,1],[-1,-1,-1,-1],"","-1"],["idc = 2201;","mapOrientation = 1;","moveOnEdges = 1;","showCountourInterval = 1;"]]
]
*/

class gps_hud
{
	idd =987654;
	duration = 9999999;
	onLoad="_this call gps_menu_fnc_loadHud";

	class controlsBackground {
		class gps_map: RscMapControl
		{
			idc = 2201;
			mapOrientation = 1;
			moveOnEdges = 1;
			showCountourInterval = 1;

			x = -0.00210969 * safezoneW + safezoneX;
			y = 0.313012 * safezoneH + safezoneY;
			w = 0.21519 * safezoneW;
			h = 0.30598 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
		};
	};

	class controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by AmauryD, v1.063, #Zavato)
		////////////////////////////////////////////////////////
		class status_text: RscText
		{
			idc = 1000;

			x = -0.00210969 * safezoneW + safezoneX;
			y = 0.618996 * safezoneH + safezoneY;
			w = 0.21519 * safezoneW;
			h = 0.0339977 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
			sizeEx = 0.5 * GUI_GRID_H;
		};
		class status_picture: RscPicture
		{
			idc = 1200;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = -0.00210969 * safezoneW + safezoneX;
			y = 0.313012 * safezoneH + safezoneY;
			w = 0.04782 * safezoneW;
			h = 0.0849944 * safezoneH;
			colorBackground[] = {1,1,1,1};
		};
		class goal_image: RscPicture
		{
			idc = 1201;

			text = "A3\ui_f\data\Map\Markers\Military\flag_CA.paa";
			x = 0.11932 * safezoneW + safezoneX;
			y = 0.313012 * safezoneH + safezoneY;
			w = 0.0159379 * safezoneW;
			h = 0.0340016 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class goal_distance: RscText
		{
			idc = 1002;

			x = 0.13526 * safezoneW + safezoneX;
			y = 0.313012 * safezoneH + safezoneY;
			w = 0.07782 * safezoneW;
			h = 0.0339977 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			sizeEx = 0.9 * GUI_GRID_H;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};

};