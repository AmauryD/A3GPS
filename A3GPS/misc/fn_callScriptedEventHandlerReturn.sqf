// will return result of the last added EH , otherwise default val

params [
	["_ehName","",[""]],
	["_parameters",[],[[]]],
	"_returnDefault"
];

_EHReturns = [missionNameSpace,_ehName,_parameters,true] call BIS_fnc_callScriptedEventHandler;

_EHReturns param [count _EHReturns - 1,_returnDefault,[_returnDefault]]; // will create an error if you return something else than boolean or nil , but won't stop the script