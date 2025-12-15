#!/bin/bash

# EXPLAINING SOM WAK AS SHIT
# To my knowlage you can't place the numbers in the order you want, they are placed in order from left to right.

# When using a doual screen setup the numbers are in roman numerals and when in desktop they are in arabic numerals, this is to distinguish the states.

# We have to make a distinction because we want the else block to not remove nodes on the laptop screen when the script is ran, but we still want it to remove nodes from the desktops associated with the monitor (that was disconnected).

main_screen_type="eDP-1"
second_screen=$(xrandr --query | grep -w 'connected' | sed -n '2p' | awk '{print $1}')

if [[ -n "$second_screen" ]]; then
    killall -q polybar
    xrandr --output eDP-1 --primary --mode 1920x1080 \
           --output HDMI-1 --mode 1920x1080 --left-of eDP-1
    xinput --map-to-output 'Raydium Corporation Raydium Touch System' eDP-1

    bspc monitor HDMI-1 -d I II III 
    bspc monitor eDP-1 -d IV V VI
    
    . $HOME/.config/bspwm/change_font.sh
    . $HOME/.config/polybar/launch_alt.sh

    feh --bg-scale pics/background/berserkdrac.png pics/background/arch-nord-dark-red.png
else
    killall -q polybar
    feh --bg-scale pics/background/berserkdrac.png

    xrandr --output eDP-1 --primary --mode 1920x1080 
    bspc monitor eDP-1 -d 1 2 3 4 5 
    xinput --map-to-output 'Raydium Corporation Raydium Touch System' eDP-1
    
    for d in I II III; do
        for n in $(bspc query -N -d $d); do
            bspc node $n -d 5
        done
    done

    # Remove second screen
    bspc desktop -r I II III
    bspc monitor HDMI-1 -r
    xrandr --output HDMI-1 --off

    . $HOME/.config/bspwm/change_font.sh
    . $HOME/.config/polybar/launch.sh
fi
