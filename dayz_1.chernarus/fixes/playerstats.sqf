[player,4,true,(getPosATL player)] spawn player_alertZombies;
 
    _kills =        player getVariable['zombieKills',0];
    _killsH =        player getVariable['humanKills',0];
    _killsB =        player getVariable['banditKills',0];
    _humanity =        player getVariable['humanity',0];
    _headShots =    player getVariable['headShots',0];
    hintSilent parseText format ["
    <t size='1'font='Bitstream'align='center'color='#C0C0C0'>MGT DayZ Epoch</t><br/>
	<t size='1'font='Bitstream'align='center' color='#228B22'>Day %9</t><br/><br/>
    <t size='1'font='Bitstream'align='left' color='#FF0000'>Blood</t><t size='1' font='Bitstream'align='right'>%1</t><br/>
    <t size='1'font='Bitstream'align='left' color='#228B22'>Humanity</t><t size='1'font='Bitstream'align='right'>%2</t><br/>
    <t size='1'font='Bitstream'align='left'color='#C0C0C0'>Murders</t><t size='1'font='Bitstream'align='right'>%3</t><br/>
    <t size='1'font='Bitstream'align='left'color='#C0C0C0'>Bandit Kills</t><t size='1'font='Bitstream'align='right'>%4</t><br/>
    <t size='1'font='Bitstream'align='left'color='#C0C0C0'>Zombie Kills</t><t size='1'font='Bitstream'align='right'>%5</t><br/>
    <t size='1'font='Bitstream'align='left'color='#C0C0C0'>Headshots</t><t size='1'font='Bitstream'align='right'>%6</t><br/>
	<t size='1'font='Bitstream'align='left'color='#C0C0C0'>FPS</t><t size='1'font='Bitstream'align='right'>%7</t><br/><br/>
    <t size='1'font='Bitstream'align='center'color='#228B22'>Restart in %8 minutes</t><br/><br/>
    <t size='1'font='Bitstream'align='center'color='#C0C0C0'>www.mgtrolls.eu</t><br/>
    <t size='1'font='Bitstream'align='center'color='#C0C0C0'>TS 188.165.250.119:9987</t><br/>",
    r_player_blood,round _humanity,_killsH,_killsB,_kills,_headShots,round diag_FPS,(179-(round(serverTime/60))),(dayz_Survived)
    ];
	
/*
player createDiarySubject ["MyDiary","My Diary"];
player createDiaryRecord ["MyDiary",["Stats", "Zombies Killed: <execute expression='player getVariable['zombieKills', 0]'</execute>"]];
player createDiaryRecord ["MyDiary",["Stats", "Headshots: <execute expression='player getVariable['headShots', 0]'</execute>"]];
player createDiaryRecord ["MyDiary",["Stats", "Murders: <execute expression='player getVariable['humanKills', 0]'</execute>"]];
player createDiaryRecord ["MyDiary",["Stats", "Bandits Killed: <execute expression='player getVariable['banditKills', 0]'</execute>"]];
player createDiaryRecord ["MyDiary",["Stats", "Humanity: <execute expression='player getVariable['humanity', 0]'</execute>"]];
*/