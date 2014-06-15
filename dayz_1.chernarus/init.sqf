/*	
	For DayZ Epoch
	Addons Credits: Jetski Yanahui by Kol9yN, Zakat, Gerasimow9, YuraPetrov, zGuba, A.Karagod, IceBreakr, Sahbazz
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
spawnShoremode = 1; // Default = 1 (on shore)
spawnArea= 1500; // Default = 1500
dayz_MapArea = 14000; // Default = 10000
dayz_minpos = -1; 
dayz_maxpos = 16000;
spawnShoremode = 0;
MaxVehicleLimit = 300;
MaxDynamicDebris = 10;
dayz_tameDogs = false;
dayz_maxAnimals = 2;
dayz_zedsAttackVehicles = false;
dayz_maxLocalZombies = 5;
dayz_maxGlobalZombiesInit = 3;
dayz_maxGlobalZombiesIncrease = 2;
dayz_maxZeds = 250;
DynamicVehicleDamageHigh = 10;
DynamicVehicleFuelLow = 40;
DZE_AllowForceSave = true;
DZE_DeathMsgGlobal = true;
DZE_BuildingLimit = 240;
DZE_HeliLift = false;
DZE_PlotPole = [30,45];
DZE_StaticConstructionCount = 3;
DZE_ForceNameTags = true;
DZE_PlayerZed = false;
DZE_BackpackGuard = false;
DZE_DiagFpsSlow = true;
DZE_MissionLootTable = true;

//Epoch Config Variables
call compile preprocessFileLineNumbers "config\epochconfig.sqf";	

// Dayz Epoch Events
EpochEvents = [
["any","any","any","any",15,"crash_spawner"],
["any","any","any","any",0,"crash_spawner"],
["any","any","any","any",15,"supply_drop"]];


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
	//Compile vehicle configs
	_nil = [] execVM "\z\addons\dayz_server\sgc\berezino.sqf";
	_nil = [] execVM "\z\addons\dayz_server\sgc\custombuild1.sqf";
	_nil = [] execVM "\z\addons\dayz_server\sgc\custombuild2.sqf";
	_nil = [] execVM "\z\addons\dayz_server\sgc\lukeBalotaAirport.sqf";
	_nil = [] execVM "\z\addons\dayz_server\sgc\lukeElektrozavodsk.sqf";
	_nil = [] execVM "\z\addons\dayz_server\sgc\lukeKamenka.sqf";
	_nil = [] execVM "\z\addons\dayz_server\sgc\lukelug.sqf";
	_nil = [] execVM "\z\addons\dayz_server\sgc\lukeNEAF.sqf";
	_nil = [] execVM "\z\addons\dayz_server\sgc\lukeNorthAirfield.sqf";
	// Add trader citys
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\mission.sqf";
	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
};

if (!isDedicated) then {
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	_nil = [] execVM "custom\remote_messages.sqf";
	[] execVM "service_point\service_point.sqf";
	[] execVM "fixes\playerstats.sqf";
	[] execVM "sgc\stats.sqf";
	[] execVM "sgc\TradeFromVehicle\init.sqf";
	 //Welcome credits, love it
	_nil = [] execVM "sgc\Server_WelcomeCredits.sqf";
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death; _nul = [] execVM "playerspawn.sqf";}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";	
	_nul = [] execVM "playerspawn.sqf";
	[] execVM "sgc\safezone.sqf";	
	_nil = [] execVM "sgc\VehicleKeyChanger\VehicleKeyChanger_init.sqf";
	[] execVM "sgc\safezonevehicle.sqf";
};
#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"
[] execVM "R3F_ARTY_AND_LOG\init.sqf";
execVM "fixes\DynamicWeatherEffects.sqf";

//Start Dynamic Weather
execVM "\z\addons\dayz_code\external\DynamicWeatherEffects.sqf";


#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"

//Mod Config 
execVM  "config\modconfig.sqf";	

rdmspwn = compile preprocessFileLineNumbers "Custom\Addons\HLSpawn\rdmspwn.sqf";
waitUntil {!isNil ("PVDZE_plr_LoginRecord")};
if (dayzPlayerLogin2 select 2) then
{
    player spawn rdmspwn;
};