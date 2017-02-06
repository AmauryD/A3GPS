/**
  @Author : [Utopia] Amaury
  @Creation : 1/02/17
  @Modified : 5/02/17
  @Description :
**/

private _node = param [0,objNull,[objNull]];

(missionNamespace getVariable format ["gps_node_%1",str _node]) select 2;