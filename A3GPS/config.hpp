/*
	All code and updates available on Github : https://github.com/AmauryD/A3GPS
*/

#include "macros.h"
#include "menu\common.hpp"
#include "menu\menu.hpp"
#include "misc\keyChoice\keyChoice.hpp"
#include "misc\text_dialog.hpp"
#include "localization.hpp"

#define false 0
#define true 1

class CfgGPS {
	//default user options
	default_marker_color = "ColorGreen";
	default_lang = "fr";

	//quicknav
	// see https://community.bistudio.com/wiki/DIK_KeyCodes for the keys number
	default_keyHandling_enable = true; //usefull when you want to implement in your own keyHandling file
	default_quicknav_open_key = 15;
	default_quicknav_switch_key = 54;
	default_quicknav_execute_key  = 28;
};

// might cause some errors if RscTitles is already defined , in this case put the includes in your other RscTitles class
class RscTitles 
{
	#include "menu\hud.hpp"
	#include "menu\quickNav.hpp"
};

