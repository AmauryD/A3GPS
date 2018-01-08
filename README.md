# A3GPS v1.0 

:information_source: v1.1 should be released this 29 january

## Description

A3GPS provides a 'real' GPS for Arma 3.

Don't hesitate to report me bugs or suggestions , it'll be with pleasure !

Translation available for english and french languages.

### Informations

The path is not always the shortest , this script is subject to new updates , stay tuned ! 	

The GPS will take 2-3 minutes to load and compute all the roads data but you can still access the menu.

## Features
- Shortest path calculation to arrive at a selected route.
- Save path and quickly start navigation again.
- Compatible with every missions (after arma 3 v1.70).
- Custom keybindings.
- HUD when you navigate.
- Path recalculation if user is taking another path.
- Quick navigation to travel for exemple to the nearest Fuel Station or Town without opening the main menu.
- Supported maps : Altis , Stratis , Malden , Tanoa . 
	- It will work on other maps but you can have performance issues.

## Installation 

### In your description.ext file 
Add this line : 
```sqf
  #include "path_to_gps_folder\config.hpp"
```

### In your init file
Add this line : 
```sqf
  [] execVM "path_to_gps_folder\init.sqf"
```

### Import the data of your current map
Put [the folder](https://github.com/AmauryD/A3GPS/tree/master/data) with the name of your map inside your gps data folder.

### To call the Menu

Use the function **gps_menu_fnc_loadGPSMenu** to call the menu 
#### Exemple if you want to open it with an AddAction
```sqf
   player addAction ["Open GPS",gps_menu_fnc_loadGPSMenu];
```

Now it should work , have fun !
To navigate , menu >> navigation >> shift + click on the map where you want to go

## Known Issues

- If you have already a **RscTitles** class , just place the 2 #include inside the class in config.hpp and move it to your other **RscTitles** class.
