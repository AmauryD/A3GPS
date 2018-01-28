# A3GPS - No interface Branch

## Description

This branch is made for server usage of the GPS algorithm.

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
