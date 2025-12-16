#!/bin/bash

# EXPLAINING SOM WAK AS SHIT
# To my knowlage you can't place the numbers in the order you want, they are placed in order from left to right.

# When using a doual screen setup the numbers are in roman numerals and when in desktop they are in arabic numerals, this is to distinguish the states.

# We have to make a distinction because we want the else block to not remove nodes on the laptop screen when the script is ran, but we still want it to remove nodes from the desktops associated with the monitor (that was disconnected).

main_screen="eDP-1"
second_screen=$(xrandr --query | grep -w 'connected' | sed -n '2p' | awk '{print $1}')

if [[ -n "$second_screen" ]]; then
    killall -q polybar
    xrandr --output $main_screen --primary --mode 1920x1080 \
           --output $second_screen  --mode 1920x1080 --left-of $main_screen
    xinput --map-to-output 'Raydium Corporation Raydium Touch System' $main_screen

    bspc monitor $second_screen -d I II III 
    bspc monitor $main_screen -d IV V VI
    
    . $HOME/.config/bspwm/change_font.sh
    . $HOME/.config/polybar/launch_alt.sh

    feh --bg-scale pics/background/berserkdrac.png pics/background/arch-nord-dark-red.png
fi
