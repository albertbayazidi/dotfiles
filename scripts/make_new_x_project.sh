#!/bin/bash

# examples of how to use code
# make_new          c_project           new_project 
# script          project type        new folder name
#
# current project types that are available: c_project/, typst_project/

make_new() {
    template="$1"
    destination="$2"

    if [[ -z "$my_string" ]]; then
	    echo "No template was picked"
    else
        cp -r ~/git/hobby/dotfiles/templates/"$template" "$destination"
    fi

}

_make_new_completions() {
    local cur="${COMP_WORDS[COMP_CWORD]}"

    if [ "$COMP_CWORD" -eq 1 ]; then
        local templates=$(ls ~/git/hobby/dotfiles/templates/ 2>/dev/null)
        COMPREPLY=( $(compgen -W "$templates" -- "$cur") )
        
    elif [ "$COMP_CWORD" -eq 2 ]; then

        COMPREPLY=( $(compgen -d -- "$cur") )
    fi
}

complete -F _make_new_completions make_new
