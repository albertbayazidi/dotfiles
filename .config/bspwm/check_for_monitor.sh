#! /bin/sh

my_laptop_external_monitor=$(xrandr --query | grep -w 'DP-1')
if [[ $my_laptop_external_monitor != *disconnected* ]]; then
    xrandr --output DP-1 --primary --mode 1920x1080 --rotate normal --output eDP-1 --mode 1920x1080 --rotate normal --left-of DP-1
    bspc monitor eDP-1 -d I II III  
    bspc monitor DP-1 -d IV V VI VII 
    polybar external & disown
    polybar mybar & disown 

  else
    xrandr --output eDP-1 --primary --mode 1920x1080 --rotate normal
    bspc monitor eDP-1 -d 1 2 3 4 5
    polybar laptop & disown
fi

