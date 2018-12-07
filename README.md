#gpghax

>Disclaimer: this can brick your console. Don't use if you don't understand every piece of how it works.

#1. Adding Custom Games:

Open games/custom.db in an SQLite Editor of your choice.
Add new entry to the GAME table as follows:
* GAME_ID = numerical identifier, has to be unique
* GAME_TITLE_STRING = Name of the game
* PUBLISHER_NAME = self explanatory
* RELEASE_YEAR = self explanatory
* PLAYERS = number of players
* RATING_IMAGE = Has to be CERO_A
* GAME_MANUAL_QR_IMAGE = Has to be QR_Code_GM
* LINK_GAME_ID = leave empty

Then you have to add the actual disc files to the DB.
Open DISC table and add new entry per each disc for the game:
* GAME_ID = GAME_ID from the GAME table
* DISC_NUMBER = disc number
* BASENAME = base name for the cue/bin file pair, i.e: SCUS-94426

Save that file.

Then you have to add actual game files, go to games dir and create a new folder with the GAME_ID from previous steps, i.e 21.
Inside of that directory you need to put at least those files:
* BASENAME.cue (use the BASENAME value from the DISC table, i.e SCUS-94426.cue)
* BASENAME.bin (use the BASENAME value from the DISC table, i.e SCUS-94426.bin)
* BASENAME.png (use the BASENAME value from the DISC table, i.e SCUS-94426.png)
* pcsx.cfg (use the default one from the sample game with id 21)

# Running:
Put everything onto an empty USB drive named SONY, plug the usb drive into the port 2 and reboot the system. If everything worked fine, you should see your custom game in the menu.

# NOTES:
If you add a game, navigate to it in the menu, close the console, and then remove said game, upon next boot the console will fail to start. You need to make sure to always shutdown the system with one of the stock games selected.

If you don't want to/don't know how to edit the database file, you can just replace the empty SCUS-94426.cue and SCUS-94426.bin files from this repo with your game (just make sure you keep the same name for the files) and it should work somewhat fine.