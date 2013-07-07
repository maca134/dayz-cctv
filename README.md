DayZ CCTV
=========

Hey, here is a simple script to use in ARMA 2/DayZ. I have only tested it in Epoch at the moment.
I have added the commits to the repo to highlight the installtion process.
I have included all the files for Epoch 1.0.1.4 with the CCTV script ready to go for either reference or to use.

## Installation Instructions

### Without Custom fn_selfActions.sqf
1. Copy CCTV folder to your mission folder.
2. Copy the custom folder.
3. In init.sqf change the following line `call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";` to `call compile preprocessFileLineNumbers "custom\compiles.sqf`.
4. Open up cctv\init.sqf to edit the config.

### With Custom fn_selfActions.sqf
1. Copy CCTV folder to your mission folder.
2. Add neafcctv.sqf to custom folder (if it doesnt exist, create it).
3. Find your custom fn_selfActions.sqf and add the following

Find this code, around line 500-550
```
if(dayz_tameDogs) then {
	//Dog
	if (_isDog and _isAlive and (_hasRawMeat) and _ownerID == "0" and player getVariable ["dogID", 0] == 0) then {
		if (s_player_tamedog < 0) then {
			s_player_tamedog = player addAction [localize "str_actions_tamedog", "\z\addons\dayz_code\actions\tame_dog.sqf", _cursorTarget, 1, false, true, "", ""];
		};
	} else {
		player removeAction s_player_tamedog;
		s_player_tamedog = -1;
	};
	if (_isDog and _ownerID == dayz_characterID and _isAlive) then {
		..........
	} else {
		player removeAction s_player_feeddog;
		s_player_feeddog = -1;
		player removeAction s_player_waterdog;
		s_player_waterdog = -1;
		player removeAction s_player_staydog;
		s_player_staydog = -1;
		player removeAction s_player_trackdog;
		s_player_trackdog = -1;
		player removeAction s_player_barkdog;
		s_player_barkdog = -1;
		player removeAction s_player_warndog;
		s_player_warndog = -1;
		player removeAction s_player_followdog;
		s_player_followdog = -1;
	};
};
```
And add after the last `};`
4. Open up cctv\init.sqf to edit the config.

```
/////////////////////////////
// CCTV Custom self actions
_isLaptop = _cursorTarget isKindOf "Notebook";
if (_isLaptop && _canDo) then {
	if (s_player_laptop < 0) then {
		s_player_laptop = player addAction ["Activate Laptop", "cctv\init.sqf",_cursorTarget, 1, true, true, "", ""];
	}
} else {
	player removeAction s_player_laptop;
	s_player_laptop = -1;
};
/////////////////////////////
```

And look for:

```
player removeAction s_player_information;
s_player_information = -1;
player removeAction s_player_fillgen;
s_player_fillgen = -1;
player removeAction s_player_fuelauto;
s_player_fuelauto = -1;
```

and add:

```
/////////////////////////////
// CCTV Custom self actions
player removeAction s_player_laptop;
s_player_laptop = -1;
/////////////////////////////
```


### Battleye
The script only needs 1 filter exception. Although this exception will probably already be in your filters, all you need to add is `!"cctv\init.sqf","`
```
5 SetCamUseTi !"\"SetCamUseTi\"," !"cctv\init.sqf","
```

### Adding Cameras

The script uses 2 models to calculate where the CCTV should be.

Notebooks are used to activate the system. In the editor they are found at __Object (small) -> Notebook__
[logo]: https://dl.dropboxusercontent.com/u/135243/Dump/notebook.jpg "Notebook"
![Notebook](https://dl.dropboxusercontent.com/u/135243/Dump/notebook.jpg)

Loudspeaks are used as camera points. In the editor they are found at __Object (small) -> Loudspeaker__
![Loudspeaker](https://dl.dropboxusercontent.com/u/135243/Dump/loudspeaker.jpg)