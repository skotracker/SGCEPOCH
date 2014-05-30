
_onScreenTime = 8;

waitUntil {!isNil "dayz_animalCheck"};
sleep 10; //Wait in seconds before the credits start after player IS ingame
 
_role1 = "Welcome to";
_role1names = ["Space Bar Gaming"];

_role3 = "DayZ Version";
_role3names = ["Epoch 1.0.4.2"];

_role5 = "Server Mods";
_role5names = ["SafeTraders", "Grass Removal", "Anti-Joe"];

_role7 = "TeamsSpeak";
_role7names = ["SERVER IP"];

_role8 = "Thanks";
_role8names = ["Sko"];

 
{
	sleep 2;
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	_finalText = format ["<t size='0.40' color='#f2cb0b' align='right'>%1<br /></t>", _memberFunction];
	_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='right'>";
	{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
	_finalText = _finalText + "</t>";
	_onScreenTime + (((count _memberNames) - 1) * 0.7);
	[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],	//DEFAULT: 0.5,0.35
		[safezoneY + safezoneH - 0.8,0.7], 	//DEFAULT: 0.8,0.7
		_onScreenTime,
		0.5
	] spawn BIS_fnc_dynamicText;
	sleep (_onScreenTime);
} forEach [
	[_role1, _role1names],
	[_role3, _role3names],
	[_role5, _role5names],
	[_role7, _role7names],
	[_role8, _role8names]
];
diag_log "[KarpCode]: Welcome credits rolled;