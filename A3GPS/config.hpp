#include "macros.h"
#include "menu\common.hpp"
#include "menu\menu.hpp"
#include "misc\text_dialog.hpp"
#include "localization.hpp"

#define false 0
#define true 1

class CfgGPS {
	//global
	gps_dir = ""; // don't forget to add a backslash at the end of the path

	//default user options
	default_marker_color = "ColorGreen";
	default_language = "fr";

	//quicknav
	default_keyHandling_enable = true; //usefull when you want to implement in your own keyHandling file
};

// might cause some errors ifA3GPS_RscTitles is already defined , in this case put the includes in your otherA3GPS_RscTitles class
class RscTitles 
{
	#include "menu\hud.hpp"
	#include "menu\quickNav.hpp"
};

