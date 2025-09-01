#! /bin/sh

# EXPLAINING SOM WAK AS SHIT
# 1. to my knowlage you can't place the numbers in the order you want, they are placed in order from left to right.
# When using a doual screen setup the numbers are in roman numerals and when in desktop they are in arabic numerals, this is to distinguish the states.
# We have to make a destination because we want the else block to not remove nodes on the laptop screen when the script is ran, but we still want it to remove nodes from the desktops associated with the monitor (that was disconnected).


external_monitor=$(xrandr --query | grep -w 'HDMI-1')

if [[ $external_monitor != *disconnected* ]]; then
    echo "screen is connected" 

    xrandr --output eDP-1 --primary --mode 1920x1080 \
           --output HDMI-1 --mode 1920x1080 --left-of eDP-1

    bspc monitor HDMI-1 -d I II III 
    bspc monitor eDP-1 -d IV V VI
    feh --bg-scale pics/background/berserkdrac.png pics/background/arch-nord-dark.png

else
    echo "screen is not connected" 
    feh --bg-scale pics/background/berserkdrac.png

    xrandr --output eDP-1 --primary --mode 1920x1080 
    xrandr --output HDMI-1 --off
    
    while bspc node @I: --kill; do
        :
    done
    while bspc node @II: --kill; do
        :
    done
    while bspc node @III: --kill; do
        :
    done
    # Remove workspaces
    bspc desktop -r I II III
    bspc monitor eDP-1 -d 1 2 3 4 5 
    bspc monitor HDMI-1 -r

fi
