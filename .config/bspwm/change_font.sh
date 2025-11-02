#!/bin/bash
# variable second_screen is retrived from check_for_monitor.sh
# Could make this into a function so that vairables in this file does not 
# leave this scope,and so we have control over what kind of variables this
# function knows of

alacritty_file=$HOME/git/hobby/dotfiles/.config/alacritty/alacritty.toml 

comment_line=$(grep -n -m 1 "#" $alacritty_file)
comment_line_nr="${comment_line:0:1}"

if [[ -n "$second_screen" ]]; then

    if (( $comment_line_nr  == 2 )); then
        cat $alacritty_file
    else
        sed -i -e '3s/^#//' -e '9s/^#//' -e '2s/^/#/' -e '8s/^/#/' $alacritty_file 

    fi

else
    echo ""
    if (( $comment_line_nr  == 2 )); then
        sed -i -e '2s/^#//' -e '8s/^#//' -e '3s/^/#/' -e '9s/^/#/' $alacritty_file 
    else
        cat $alacritty_file
    fi

fi
