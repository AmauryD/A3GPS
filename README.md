# A3GPS

## Description

A3GPS provides a real GPS for Arma 3.

Only available in french for now , will be translated later.

Developpement in progress.

## Installation

### in your description.ext file add : 
```sqf
  #include "path_to_gps_folder\config.hpp"
```

### in your init file file add : 
```sqf
  [] execVM "path_to_gps_folder\init.sqf"
```

### In the gps init file :
  -edit the folder path for each functions
  exemple :
  ```sqf
  gps_fnc_generatePathHelpers = compileFinal preprocessFileLineNumbers "gps\fn_generatePathHelpers.sqf";
   ```
  to
  ```sqf
  gps_fnc_generatePathHelpers = compileFinal preprocessFileLineNumbers "client\addons\gps\fn_generatePathHelpers.sqf";
  ```
  
Now it should work , have fun !

## Known Issues
