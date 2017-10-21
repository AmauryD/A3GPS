#include "macros.h"
#include "menu\common.hpp"
#include "menu\menu.hpp"
#include "misc\text_dialog.hpp"
#include "localization.hpp"

#define false 0
#define true 1

class CfgGPS {
	//global
	gps_dir = "";
	default_marker_color = "ColorGreen";
	default_language = "fr";

	//hud
	hud_clock_enabled = false;
	hud_azimuth_enabled = true;
	hud_gridpos_enabled = true;

	//quicknav
	default_keyHandling_enable = false; //usefull when you want to implement in your own keyHandling file
};


class RscTitles 
{
	#include "menu\hud.hpp"
	#include "menu\quickNav.hpp"
};

