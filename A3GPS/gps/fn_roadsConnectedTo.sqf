#include "..\macros.h"
/**
  @Author : [Utopia] Amaury
  @Creation : 1/02/17
  @Modified : 5/02/17
  @Description :
**/

private _road = param [0,objNull,[objNull]];

[gps_roadsWithConnected,parseNumber str _road] call misc_fnc_hashTable_find;