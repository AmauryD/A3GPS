#include "..\macros.h"
/**
  @Author : [Utopia] Amaury
  @Creation : 1/02/17
  @Modified : 5/02/17
  @Description : deletes all the helpers on the road and on the map
**/

{deleteMarkerLocal _x}forEach gps_local_markers;
gps_local_markers =	[];
