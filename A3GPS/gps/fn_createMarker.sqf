/**
  @Author : [Utopia] Amaury
  @Creation : 18/06/17
  @Modified : 18/06/17
  @Description : same as createMarker but add it to the gps markers list
**/

private _marker = _this call misc_fnc_createMarker;
gps_local_markers pushBack _marker;
_marker