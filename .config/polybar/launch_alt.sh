#!/bin/bash

CONFIG_DIR=$HOME/.config/polybar/config.ini

polybar external -c $CONFIG_DIR & disown
polybar left-alt -c $CONFIG_DIR & disown 
polybar right -c $CONFIG_DIR & disown 


