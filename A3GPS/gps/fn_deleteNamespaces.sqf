/**
  @Author : [Utopia] Amaury
  @Creation : 27/12/17
  @Modified : --
  @Description : 
**/

{
	if (name _x isEqualTo "temp") then {
		deleteLocation _x;
	};
}foreach (nearestLocations [[0,0,0],["fakeTown"],1]);