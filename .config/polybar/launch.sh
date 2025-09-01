#!/bin/bash

CONFIG_DIR=$(dirname $0)/config.ini
echo $CONFIG_DIR

polybar left -c $CONFIG_DIR &
polybar right -c $CONFIG_DIR &

