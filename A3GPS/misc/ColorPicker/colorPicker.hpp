/* #Wajaxi
$[
	1.063,
	["colorPicker",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[2200,"Background",[1,"",["0.30875 * safezoneW + safezoneX","0.33 * safezoneH + safezoneY","0.366562 * safezoneW","0.34 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1900,"R_slider",[1,"R",["0.348594 * safezoneW + safezoneX","0.415 * safezoneH + safezoneY","0.278906 * safezoneW","0.034 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1901,"G_slider",[1,"",["0.348594 * safezoneW + safezoneX","0.483 * safezoneH + safezoneY","0.278906 * safezoneW","0.034 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1902,"B_slider",[1,"",["0.348594 * safezoneW + safezoneX","0.551 * safezoneH + safezoneY","0.278906 * safezoneW","0.034 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"pick_btn",[1,"Pick",["0.324687 * safezoneW + safezoneX","0.619 * safezoneH + safezoneY","0.103594 * safezoneW","0.034 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1601,"cancel_btn",[1,"Cancel",["0.555781 * safezoneW + safezoneX","0.619 * safezoneH + safezoneY","0.103594 * safezoneW","0.034 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"main_header",[1,"RGB color picker",["0.316719 * safezoneW + safezoneX","0.347 * safezoneH + safezoneY","0.342656 * safezoneW","0.034 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1800,"current_color",[1,"",["0.452187 * safezoneW + safezoneX","0.619 * safezoneH + safezoneY","0.0796875 * safezoneW","0.034 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"R_text",[1,"R",["0.316719 * safezoneW + safezoneX","0.415 * safezoneH + safezoneY","0.0159375 * safezoneW","0.034 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1002,"G_text",[1,"G",["0.316719 * safezoneW + safezoneX","0.483 * safezoneH + safezoneY","0.0159375 * safezoneW","0.034 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1003,"B_text",[1,"B",["0.316719 * safezoneW + safezoneX","0.551 * safezoneH + safezoneY","0.0159375 * safezoneW","0.034 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1004,"R_text_pick",[1,"",["0.635469 * safezoneW + safezoneX","0.415 * safezoneH + safezoneY","0.031875 * safezoneW","0.034 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1005,"G_text_pick",[1,"",["0.635469 * safezoneW + safezoneX","0.483 * safezoneH + safezoneY","0.031875 * safezoneW","0.034 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1006,"B_text_pick",[1,"",["0.635469 * safezoneW + safezoneX","0.551 * safezoneH + safezoneY","0.031875 * safezoneW","0.034 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/
class colorPicker
{
	idd = 30705;
	class controlsBackground {
		class Background: A3GPS_IGUIBack
		{
			idc = 2200;
			x = 0.30875 * safezoneW + safezoneX;
			y = 0.33 * safezoneH + safezoneY;
			w = 0.366562 * safezoneW;
			h = 0.34 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
	};
	class controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by AmauryD, v1.063, #Wajaxi)
		////////////////////////////////////////////////////////
		class R_slider: A3GPS_RscSlider
		{
			idc = 1900;
			text = "R"; //--- ToDo: Localize;
			x = 0.348594 * safezoneW + safezoneX;
			y = 0.415 * safezoneH + safezoneY;
			w = 0.278906 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class G_slider: A3GPS_RscSlider
		{
			idc = 1901;
			x = 0.348594 * safezoneW + safezoneX;
			y = 0.483 * safezoneH + safezoneY;
			w = 0.278906 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class B_slider: A3GPS_RscSlider
		{
			idc = 1902;
			x = 0.348594 * safezoneW + safezoneX;
			y = 0.551 * safezoneH + safezoneY;
			w = 0.278906 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class pick_btn: A3GPS_RscButton
		{
			idc = 1600;
			text = "Pick"; //--- ToDo: Localize;
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.619 * safezoneH + safezoneY;
			w = 0.103594 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class cancel_btn: A3GPS_RscButton
		{
			idc = 1601;
			text = "Cancel"; //--- ToDo: Localize;
			x = 0.555781 * safezoneW + safezoneX;
			y = 0.619 * safezoneH + safezoneY;
			w = 0.103594 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class main_header: A3GPS_RscText
		{
			idc = 1000;
			text = "RGB color picker"; //--- ToDo: Localize;
			x = 0.316719 * safezoneW + safezoneX;
			y = 0.347 * safezoneH + safezoneY;
			w = 0.342656 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class current_color: A3GPS_IGUIBack
		{
			idc = 1800;
			x = 0.452187 * safezoneW + safezoneX;
			y = 0.619 * safezoneH + safezoneY;
			w = 0.0796875 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class R_text: A3GPS_RscText
		{
			idc = 1001;
			text = "R"; //--- ToDo: Localize;
			x = 0.316719 * safezoneW + safezoneX;
			y = 0.415 * safezoneH + safezoneY;
			w = 0.0159375 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class G_text: A3GPS_RscText
		{
			idc = 1002;
			text = "G"; //--- ToDo: Localize;
			x = 0.316719 * safezoneW + safezoneX;
			y = 0.483 * safezoneH + safezoneY;
			w = 0.0159375 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class B_text: A3GPS_RscText
		{
			idc = 1003;
			text = "B"; //--- ToDo: Localize;
			x = 0.316719 * safezoneW + safezoneX;
			y = 0.551 * safezoneH + safezoneY;
			w = 0.0159375 * safezoneW;
			h = 0.034 * safezoneH;
		};
		/*
		class R_text_pick: A3GPS_RscText
		{
			idc = 1004;
			x = 0.635469 * safezoneW + safezoneX;
			y = 0.415 * safezoneH + safezoneY;
			w = 0.031875 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class G_text_pick: A3GPS_RscText
		{
			idc = 1005;
			x = 0.635469 * safezoneW + safezoneX;
			y = 0.483 * safezoneH + safezoneY;
			w = 0.031875 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class B_text_pick: A3GPS_RscText
		{
			idc = 1006;
			x = 0.635469 * safezoneW + safezoneX;
			y = 0.551 * safezoneH + safezoneY;
			w = 0.031875 * safezoneW;
			h = 0.034 * safezoneH;
		};
		*/
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};