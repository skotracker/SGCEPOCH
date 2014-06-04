/*	
	For DayZ Epoch
	Addons Credits: Jetski Yanahui by Kol9yN, Zakat, Gerasimow9, YuraPetrov, zGuba, A.Karagod, IceBreakr, Sahbazz
	SGC Copy
*/
startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

//REALLY IMPORTANT VALUES
dayZ_instance =	11;					//The instance
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;
server_name = "SGC";

//disable greeting menu 
player setVariable ["BIS_noCoreConversations", true];
//disable radio messages to be heard and shown in the left lower corner of the screen
enableRadio false;
// May prevent "how are you civillian?" messages from NPC
enableSentences false;

// DayZ Epoch config
spawnShoremode = 0; // Default = 1 (on shore)
spawnArea= 1500; // Default = 1500
dayz_MapArea = 14000; // Default = 10000
dayz_minpos = -1; 
dayz_maxpos = 16000;
DZE_AllowForceSave = true;
DZE_PlayerZed = false;
setViewDistance 2000;
setTerrainGrid 50;

//Epoch Config Variables
call compile preprocessFileLineNumbers "config\epochconfig.sqf";	

// Dayz Epoch Events
EpochEvents = [
["any","any","any","any",30,"crash_spawner"],
["any","any","any","any",0,"crash_spawner"],
["any","any","any","any",15,"supply_drop"],
["any","any","any","any",15,"Construction"],
["any","any","any","any",45,"Military"],
["any","any","any","any",35,"Supplyitems"],
["any","any","any","any",25,"Treasure"]
];


//Load in compiled functions
call compile preprocessFileLineNumbers "init\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "init\publicEH.sqf";				//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "init\compiles.sqf";				//Compile regular functions
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "traders\server_traders.sqf";				//Compile trader configs
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then {
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\dynamic_vehicle.sqf";
	//Custom tows/buildings
	_nil = [] execVM "\z\addons\dayz_server\karpcode\custombuild1.sqf";
	_nil = [] execVM "\z\addons\dayz_server\karpcode\custombuild2.sqf";
	_nil = [] execVM "\z\addons\dayz_server\karpcode\lukelug.sqf";
	// Add trader citys
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\mission.sqf";
	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
};

if (!isDedicated) then {
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	//3rd Party scripts
	_nil = [] execVM "custom\remote_messages.sqf";
	[] execVM "karpCode\stats.sqf";
	_nil = [] execVM "karpCode\Server_WelcomeCredits.sqf";
	
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";	
	[] execVM "safezone.sqf";	
};

//Start Dynamic Weather
execVM "\z\addons\dayz_code\external\DynamicWeatherEffects.sqf";
//Nighttime lights
[] execVM "karpCode\change_streetlights.sqf";

#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"

//Mod Config 
execVM  "config\modconfig.sqf";	
//DayZ Watermark
if (!isNil "server_name") then {
	[] spawn {
		waitUntil {(!isNull Player) and (alive Player) and (player == player)};
		waituntil {!(isNull (findDisplay 46))};
		5 cutRsc ["wm_disp","PLAIN"];
		((uiNamespace getVariable "wm_disp") displayCtrl 1) ctrlSetText server_name;
	};
};
diag_log "[KarpCode]: Init read;