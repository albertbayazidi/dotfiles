#!/bin/bash

CONFIG_DIR=$HOME/.config/polybar/config.ini

polybar external -c $CONFIG_DIR & 
polybar left-alt -c $CONFIG_DIR &
polybar right -c $CONFIG_DIR &


