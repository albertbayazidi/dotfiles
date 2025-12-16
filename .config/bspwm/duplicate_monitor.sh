#!/bin/sh

# EXPLAINING SOM WAK AS SHIT
# 1. to my knowlage you can't place the numbers in the order you want, they are placed in order from left to right.

# When using a doual screen setup the numbers are in roman numerals and when in desktop they are in arabic numerals, this is to distinguish the states.

# We have to make a distinction because we want the else block to not remove nodes on the laptop screen when the script is ran, but we still want it to remove nodes from the desktops associated with the monitor (that was disconnected).

# bspwm will use the extra monitor as an extra screen, if we don't remove it then going to the first desktop with super + 1 will send you to nothingness
main_screen="eDP-1"
second_screen=$(xrandr --query | grep -w 'connected' | sed -n '2p' | awk '{print $1}')

if [[ -n "$second_screen"  ]]; then

    killall -q polybar
    bspc monitor $main_screen -d 1 2 3 4 5 
    
    for d in I II III; do
        for n in $(bspc query -N -d $d); do
            bspc node $n -d 5
        done
    done
    
    bspc desktop -r I II III
    
    xrandr --output $main_screen --primary --mode 1920x1080 \
           --output $second_screen --mode 1920x1080 --same-as $main_screen
    xinput --map-to-output 'Raydium Corporation Raydium Touch System' $main_screen

    bspc monitor $second_screen -r

    . $HOME/.config/polybar/launch.sh

fi
