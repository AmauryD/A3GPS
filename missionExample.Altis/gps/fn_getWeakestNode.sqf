/**
  @Author : [Utopia] Amaury
  @Creation : 1/02/17
  @Modified : 5/02/17
  @Description :
**/

private _return = [objNull,-1,false];
private _weakest = 999999;

{
	_node = missionNamespace getVariable format ["gps_node_%1",str _x];
	_currNode = _node select 0;
	_currWeight = _node select 1;
	_currCheck = _node select 2;

	if(_currWeight < _weakest && !_currCheck && _currWeight != -1) then {
		_weakest = _currWeight;
		_return = _node;
	};
}foreach gps_onlyCrossRoads;

_return