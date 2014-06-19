while { !canbuild } do
{
	waitUntil{canbuild or !isNull (FindDisplay 106)};

	if( !isNull (FindDisplay 106) ) then
	{
		if( !isNull cursorTarget ) then
		{
			_cTarget = cursorTarget;
			_blk = false;
			{
				if(!_blk) then {
					_blk = _cTarget isKindOf _x;
				};
			} forEach ["LandVehicle","Air","Man"];

			if( _blk ) then {
				titleText["\n\n*** anti-theft ***", "PLAIN DOWN",0];
				(FindDisplay 106) closeDisplay 1;
			};
		};
	};
};