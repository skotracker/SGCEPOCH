//Written by Matt L http://opendayz.net/members/matt-l.7134/
// 5/12/2014
//Feel free to edit to your liking, just give credit where it is due!
//Thanks to Armbot for the idea && test server

if (dayz_combat == 1) then {
	titleText ["wut.", "PLAIN DOWN", 3];
	sleep 5;
	titleFadeOut 1;
} else {
	
	player addWeapon 'MeleeHatchet';
	player addWeapon 'MakarovSD';
	player selectWeapon 'MakarovSD';
	player addMagazine '8Rnd_9x18_MakarovSD';
	player addMagazine 'ItemMorphine';
	player addMagazine 'ItemSodaMdew';
	player addMagazine 'FoodCanBakedBeans';
	player addMagazine 'ItemPainkiller';
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addWeapon 'ItemMap';
	player addWeapon 'ItemKnife';
	player addWeapon 'ItemEtool';
	removeBackpack player;
	player addBackPack "CZ_VestPouch_Ep1";
	reload player;
	
	cuttext ["You are a Bandit level 4", "PLAIN DOWN"];

	sleep 2;
	
};
