/*
	All code and updates available on Github : https://github.com/AmauryD/A3GPS
*/

#include "macros.h"
#include "menu\common.hpp"
#include "menu\menu.hpp"
#include "misc\keyChoice\keyChoice.hpp"
#include "misc\EditDialog\text_dialog.hpp"
#include "misc\colorPicker\colorPicker.hpp"
#include "localization.hpp"

#define false 0
#define true 1

class CfgGPS {
	//default user options
	default_marker_color[] = {0,1,1,1};
	default_lang = "fr";
	default_metric = "km";

	//quicknav
	// see https://community.bistudio.com/wiki/DIK_KeyCodes for the keys number
	class Keys {
		class quicknav_open_key {
			default = 15;
			name = "STR_quicknav_open_key";
		};
		class quicknav_switch_key {
			default = 54;
			name = "STR_quicknav_switch_key";
		};
		class quicknav_execute_key {
			default = 28;
			name = "STR_quicknav_execute_key";
		};
	};
};

// might cause some errors if RscTitles is already defined , in this case put the includes in your other RscTitles class
class RscTitles 
{
	#include "menu\hud.hpp"
	#include "menu\quickNav.hpp"
};