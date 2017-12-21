# A3GPS v1.0 

## Description

A3GPS provides a 'real' GPS for Arma 3.

**A3GPS is still in developpement but is now usable without major bugs on Altis**.

Don't hesitate to report me bugs or suggestions , it'll be with pleasure !

Translation available for english and french languages.

### Informations

The path is not always the shortest , this script is subject to new updates , stay tuned ! 

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

### In the config.hpp file :
If your gps installation is not in the root directory then change the **gps_dir** value to your directory with a **\\** at the end of the path.

### To call the Menu

Use the function **gps_menu_fnc_loadGPSMenu** to call the menu

Now it should work , have fun !

## Known Issues

- If you have already a mission with defined controls class , the mission will throw you an error "class XXX already defined ..." . to fix this , just remove the file common.hpp and the '#include "common.hpp"' in the menu.hpp in the menu folder.

## For Mission Makers
TODO
