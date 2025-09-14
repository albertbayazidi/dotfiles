#!/bin/bash

# have at most two weekly copys, delete the oldes
# have at most three daily copys, delete the oldes  

# add some sort of compression afterwards
# add some simple flag that allows for revocery from this command

local_backup () {
    local destination="$HOME/docs/backups/home"
    local source="$HOME/"
    local flags="-azPh"
    local excludes=(
        "docs/backups"
        "git/*"
        ".git/*"
        ".cache/*"
        ".local/*"
        ".mozilla/*"
        ".zotero/*"
        ".npm/*"
        ".zoom/*"
        ".pki/*"
        ".parallel/*"
    )

    rsync "$flags" --delete "${excludes[@]/#/--exclude=}" "$source" "$destination"
}
