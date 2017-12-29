Want to generate the data for your map ?

Use this command and paste the content of your clipboard in the AllRoads.sqf file of your world
You can get the world name with the 'worldName' command.

```sqf
  copyToClipboard str (([worldSize / 2,worldSize / 2,0] nearRoads worldSize) apply {getPosATL _x})
```
