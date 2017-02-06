/**
	@Author : [Utopia] Amaury
	@Creation : 1/02/17
	@Modified : 4/02/17
	@Description : creates a local marker , really simple
**/


private _name = param [0,str (random 100 + random 200),[""]];
private _pos = param [1,[0,0,0],[[]]];
private _text = param [2,"",[""]];
private _type = param [3,"mil_dot",[""]];
private _color = param [4,"ColorBlack",[""]];

_mark = createMarkerLocal [_name,_pos];
_mark setMarkerTextLocal _text;
_mark setMarkerTypeLocal _type;
_mark setMarkerColorLocal _color;

_mark