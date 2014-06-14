//Written by Matt L http://opendayz.net/members/matt-l.7134/
// 5/12/2014
//Feel free to edit to your liking, just give credit where it is due!
//Thanks to Armbot for the idea && test server

if (dayz_combat == 1) then {
	titleText ["wut.", "PLAIN DOWN", 3];
	sleep 5;
	titleFadeOut 1;
} else {
	player addWeapon 'ItemMachete';
	player addWeapon 'Makarov';
	player selectWeapon 'Makarov';
	player addMagazine '8Rnd_9x18_Makarov';
	player addMagazine 'ItemSodaMdew';
	player addMagazine 'FoodCanBakedBeans';
	player addMagazine 'ItemPainkiller';
	player addMagazine 'ItemBandage';
	player addMagazine 'ItemBandage';
	player addWeapon 'ItemMap';
	player addWeapon 'ItemKnife';
	player addWeapon 'ItemEtool';
	removeBackpack player;
	player addBackPack "DZ_Patrol_Pack_Ep1";
	reload player;
};
	