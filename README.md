This is a collection of 3 scripts that can be used to easily switch between saves for The Sims 4.
How it works:
- These scripts work only by manipulating the files in the default "Electronic Arts" directory that contains your "The Sims 4" save folder.
- These scripts must be run from inside the "Electronic Arts" directory.
- Switching from one to anther causes it to backup the active save files to whatever you are switching from into a logically named folder.
- The scripts have logic to handle being run with no setup. It will take the current active save and make a copy of it for both multiplayer and single player. At which point the saves will diverge. Meaning any changes to the save made in singleplayer will not show up in multiplayer and vice-versa.

Things to know before running these scripts:
- These scripts ONLY move around save files. They have no impact what so ever on if multiplayer is installed or working. To get The Sims 4 Multiplayer working you will need to follow the instructions and information located here: https://sims-multiplayer.com/

Setup and 1st time switch:
- Simply extract the zip containing these files into your "Electronic Arts" folder directory located in "C:\Users\{Your User Name}\Documents\Electronic Arts"
- Run the "Manual Backup.ps1" script by right clicking on it and clicking "Run with PowerShell". Allow this script to run to completion. (This is not technically a required step as it is simply backing up the data and making no changes but I strongly encourage backing up your save before switching, just in case something goes wrong.)
- Run either the "Multiplayer to Singleplayer.ps1" or "Singleplayer to Multiplayer.ps1" scripts by right clicking and selecting "Run with PowerShell". Regardless of which you choose it will automatically make two copies of your current save one for multiplayer and one for singleplayer. At that point the singleplayer and multiplayer saves will be distinct and running the scripts again will switch between the two distinct saves.

QA:
--------------------------------------------------------------------------------------
Q: Can I share this script with my friends or strangers I like the look of?

A: Sure, you can share the script, modify it, print it out and hang it on your wall. I really don't care what you do with it.
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
Q: How can I tell which version is currently active?

A: You can check which save you currently have active by going to "C:\Users\{Your User Name}\Documents\Electronic Arts" and reading the folder names to see which is set to active.
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
Q: Why is there 3 folders? A "Multiplayer - The Sims 4", a "Singleplayer The Sims 4" and a "The Sims 4" with either single player or multiplayer having "(ACTIVE)" after it?

A: The actual folder being used by the game is and always will be "The Sims 4". The other folders contain backups of the saves from the last time you switched with the "(ACTIVE)" be appended to whichever save was placed in "The Sims 4" folder at the time the script was last run. So keep in mind the folder labeled "(ACIVE)" is actually just the copy that was moved to "The Sims 4" when the script was run, so any further changes to save made by playing the game WILL NOT BE INCLUDED in this folder. "The Sims 4" folder is the ultimate source of truth and the only folder that contains changes made since running the script.
--------------------------------------------------------------------------------------