#!/bin/bash

ALACRITTY_CONF="/home/albert/git/hobby/dotfiles/.config/alacritty/alacritty.toml"
STATE=$1

if [ "$STATE" = "fullscreen" ]; then
    sed -i 's/^[[:space:]]*opacity = .*/opacity = 1.0/' "$ALACRITTY_CONF"
else
    sed -i 's/^[[:space:]]*opacity = .*/opacity = 0.9/' "$ALACRITTY_CONF"
fi
