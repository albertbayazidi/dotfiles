#!/bin/bash

[ -f .env ] && source .env

# have at most two weekly copys, delete the oldes
# have at most three daily copys, delete the oldes  

# add some sort of compression afterwards
# add some simple flag that allows for revocery from this command

home_backup () {
    local destination="$SERVER_LOCATION:laptop_backups/home_backup"
    local flags="-azPh"

    local include=(
        "docs"
        "downloads"
        "pics"
        )

    local excludes=(
        "docs/backups"
        ".git"
        ".cache"
        "*.dat"
    )

    rsync "$flags" --delete -e "ssh -i $SSH_KEY_PATH" "${excludes[@]/#/--exclude=}" "${include[@]/#/$HOME/}" "$destination"
}
