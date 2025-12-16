#!/bin/bash
main_screen="eDP-1"
mapfile -t monitors < <(bspc query -M --names)

# Get a list of all monitors
for (( i=0; i<${#monitors[@]}; i++ )); do
    if [[ "${monitors[$i]}" == "$main_screen" ]]; then
        unset "monitors[$i]"
    fi
done

monitors=("${monitors[@]}")

if [[ ${#monitors[@]} -gt 0 ]]; then 
    killall -q polybar
    
    xrandr --output $main_screen --primary --mode 1920x1080 
    bspc monitor $main_screen -d 1 2 3 4 5 

    for d in I II III; do
        for n in $(bspc query -N -d $d); do
            bspc node $n -d 5
        done
    done
    
    bspc desktop -r I II III
    # Removes all extra screens
    for monit in "${monitors[@]}"; do
        bspc monitor $monit -r
        xrandr --output $monit --off
    done
    
    xinput --map-to-output 'Raydium Corporation Raydium Touch System' $main_screen

    . $HOME/.config/bspwm/change_font.sh
    . $HOME/.config/polybar/launch.sh
fi

