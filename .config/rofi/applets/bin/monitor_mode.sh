#!/usr/bin/env bash

source "$HOME/.config/rofi/applets/shared/theme.bash"
theme="$type/$style"

# Theme Elements
prompt="Monitor mode"
mesg="Pick monitor mode"

list_col="3"
list_row="1"

# Options
option_1="󱎴"
option_2="󰍺"
option_3="󰌢"

# Rofi CMD
rofi_cmd() {
	rofi -theme-str "listview {columns: $list_col; lines: $list_row;}" \
		-theme-str 'textbox-prompt-colon {str: "󰍹";}' \
		-dmenu \
		-p "$prompt" \
		-mesg "$mesg" \
		-theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3" | rofi_cmd
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option_1) $HOME/.config/bspwm/extend_monitor.sh ;;
    $option_2) $HOME/.config/bspwm/duplicate_monitor.sh ;; 
    $option_3) $HOME/.config/bspwm/normal_monitor.sh ;;  
esac

