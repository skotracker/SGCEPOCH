//Written by Matt L http://opendayz.net/members/matt-l.7134/
// 5/12/2014
//Feel free to edit to your liking, just give credit where it is due!
//Thanks to Armbot for the idea && test server

if ((player getVariable ["humanity",0] > 4000) && (player getVariable ["humanity",0] < 5000)) then {

	_pathToScriptsHero1 = "Custom\Addons\HLSpawn\Gear\Hero\One\";

	_scriptArrayHero1 = "1.sqf","2.sqf","3.sqf","4.sqf","5.sqf";

	_randomScriptHero1 = [_scriptArrayHero1] call BIS_fnc_selectRandom;

	[] execVM format["%1%2",_pathToScriptsHero1,_randomScriptHero1];
	
	sleep 2;
	
	 };	
	 
if ((player getVariable ["humanity",0] > 5000) && (player getVariable ["humanity",0] < 10000)) then {
	
	_pathToScriptsHero2 = "Custom\Addons\HLSpawn\Gear\Hero\Two\";

	_scriptArrayHero2 = "1.sqf","2.sqf","3.sqf","4.sqf","5.sqf";

	_randomScriptHero2 = [_scriptArrayHero2] call BIS_fnc_selectRandom;

	[] execVM format["%1%2",_pathToScriptsHero2,_randomScriptHero2];
	
	sleep 2;
	
	 };	
	 
if ((player getVariable ["humanity",0] > 10000) && (player getVariable ["humanity",0] < 15000)) then {
	
	_pathToScriptsHero3 = "Custom\Addons\HLSpawn\Gear\Hero\Three\";

	_scriptArrayHero3 = "1.sqf","2.sqf","3.sqf","4.sqf","5.sqf";

	_randomScriptHero3 = [_scriptArrayHero3] call BIS_fnc_selectRandom;

	[] execVM format["%1%2",_pathToScriptsHero3,_randomScriptHero3];
	
	sleep 2;
	
	 };	
	 
if ((player getVariable ["humanity",0] > 15000) && (player getVariable ["humanity",0] < 20000)) then {
	
	_pathToScriptsHero4 = "Custom\Addons\HLSpawn\Gear\Hero\Four\";

	_scriptArrayHero4 = "1.sqf","2.sqf","3.sqf","4.sqf","5.sqf";

	_randomScriptHero4 = [_scriptArrayHero4] call BIS_fnc_selectRandom;

	[] execVM format["%1%2",_pathToScriptsHero4,_randomScriptHero4];
	
	sleep 2;
	
	 };	
	 
if (player getVariable ["humanity",0] > 20000) then {
	
	_pathToScriptsHero5 = "Custom\Addons\HLSpawn\Gear\Hero\Five\";

	_scriptArrayHero5 = "1.sqf","2.sqf","3.sqf","4.sqf","5.sqf";

	_randomScriptHero5 = [_scriptArrayHero5] call BIS_fnc_selectRandom;

	[] execVM format["%1%2",_pathToScriptsHero5,_randomScriptHero5];

	sleep 2;
	
	 };	
	
if ((player getVariable ["humanity",0] < -1500) && (player getVariable ["humanity",0] > -3000)) then {
	
	_pathToScriptsB1 = "Custom\Addons\HLSpawn\Gear\Bandit\One\";

	_scriptArrayB1 = "1.sqf","2.sqf","3.sqf","4.sqf","5.sqf";

	_randomScriptB1 = [_scriptArrayB1] call BIS_fnc_selectRandom;

	[] execVM format["%1%2",_pathToScriptsB1,_randomScriptB1];

	sleep 2;
	
	};
	
if ((player getVariable ["humanity",0] < -3000) && (player getVariable ["humanity",0] > -6000)) then {
	
	_pathToScriptsB2 = "Custom\Addons\HLSpawn\Gear\Bandit\Two\";

	_scriptArrayB2 = "1.sqf","2.sqf","3.sqf","4.sqf","5.sqf";

	_randomScriptB2 = [_scriptArrayB2] call BIS_fnc_selectRandom;

	[] execVM format["%1%2",_pathToScriptsB2,_randomScriptB2];

	sleep 2;
	
	};
	
if ((player getVariable ["humanity",0] < -6000) && (player getVariable ["humanity",0] > -9000)) then {

	_pathToScriptsB3 = "Custom\Addons\HLSpawn\Gear\Bandit\Three\";

	_scriptArrayB3 = "1.sqf","2.sqf","3.sqf","4.sqf","5.sqf";

	_randomScriptB3 = [_scriptArrayB3] call BIS_fnc_selectRandom;

	[] execVM format["%1%2",_pathToScriptsB3,_randomScriptB3];

	sleep 2;
	
	};

if ((player getVariable ["humanity",0] < -9000) && (player getVariable ["humanity",0] > -12000)) then {
	
	_pathToScriptsB4 = "Custom\Addons\HLSpawn\Gear\Bandit\Four\";

	_scriptArrayB4 = "1.sqf","2.sqf","3.sqf","4.sqf","5.sqf";

	_randomScriptB4 = [_scriptArrayB4] call BIS_fnc_selectRandom;

	[] execVM format["%1%2",_pathToScriptsB4,_randomScriptB4];

	sleep 2;
	
	};
	
if (player getVariable ["humanity",0] < -12000) then {
	
	_pathToScriptsB5 = "Custom\Addons\HLSpawn\Gear\Bandit\Five\";

	_scriptArrayB5 = "1.sqf","2.sqf","3.sqf","4.sqf","5.sqf";

	_randomScriptB5 = [_scriptArrayB5] call BIS_fnc_selectRandom;

	[] execVM format["%1%2",_pathToScriptsB5,_randomScriptB5];

	sleep 2;
	
	};
	
if ((player getVariable ["humanity",0] < 4000) && (player getVariable ["humanity",0] > -1500)) then {
	
	_pathToScriptsS = "Custom\Addons\HLSpawn\Gear\Survivor\One\";

	_scriptArrayS = "1.sqf","2.sqf","3.sqf","4.sqf","5.sqf";

	_randomScriptS = [_scriptArrayS] call BIS_fnc_selectRandom;

	[] execVM format["%1%2",_pathToScriptsS,_randomScriptS];

	sleep 2;
	
	};
	