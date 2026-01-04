# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[VPS \W]λ '

# Exports
. $HOME/.config/bash/exports.sh  

# Settings
. $HOME/.config/bash/settings.sh  

# Alias
. $HOME/.config/bash/alias.sh

. "/root/.local/share//cargo/env"
