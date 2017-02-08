# A3GPS

## Description

A3GPS provides a real GPS for Arma 3.

Only available in french for now , will be translated later.

Developpement in progress.

#### Informations

The path calculating may be slow for now , it'll be improved later.

The path is not real time calculated : if you're not following the path , the GPS will not generate a new path automatically.

The path is not always the shortest , I need to improve the virtual mapping.

## Installation

#### in your description.ext file 
Add this line : 
```sqf
  #include "path_to_gps_folder\config.hpp"
```

#### in your init file file 
Add this line : 
```sqf
  [] execVM "path_to_gps_folder\init.sqf"
```

#### In the gps init file :
Edit the folder path for each functions.
  
  Exemple :
  ```sqf
  gps_fnc_generatePathHelpers = compileFinal preprocessFileLineNumbers "gps\fn_generatePathHelpers.sqf";
  ```
  to
  ```sqf
  gps_fnc_generatePathHelpers = compileFinal preprocessFileLineNumbers "client\addons\gps\fn_generatePathHelpers.sqf";
  ```
  
Now it should work , have fun !

## Known Issues

- If you already have a 'CfgHints' class defined , juste copy the content of the cfgHints in config.hpp into it.

- If you have already a mission with defined controls class , the mission will throw you an error "class XXX already defined ..." . to fix this , just remove the file common.hpp and the '#include "common.hpp"' in the menu.hpp in the menu folder.




