#!/bin/bash

CONFIG_DIR=$(dirname $0)/config.ini
echo $CONFIG_DIR

polybar main -c $CONFIG_DIR 

