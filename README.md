# Hunter's dwm Rice and Status Bar

This is my personal version of suckless dwm 6.2 with a few minor alterations.

## Patches
The only patch is the vanitygaps patch from the suckless website.

## Additions
The first addition was the inclusion of multimedia key functions allowing the volume and screen brightness to be adjusted with their respective keys (if multimedia keys are present).

The second is the addition of a function to change the keyboard layout. By default the options are between the standard US layout and the US-Int version. The standard US layout is selected with "MOD+Shift+E" for English and the international keyboard is selected with "MOD+Shift+F" (which means French in my case though it is no the french keyboard). This should be easily modifiable to for whichever keyboard layouts you wish.

## Status Bar
Also included is the `status.sh` script, which I use to display the keyboard layout, volume, battery, date, and time.

## Install
Edit config.mk to suit your needs then just run `# make clean install` and you should be good to go.

For the status bar script, copy it to a location in your path, and make it executable with `$ chmod +x status.sh`, and then add `status &` to your `.xinitrc` file to start it before the exec dwm command.
