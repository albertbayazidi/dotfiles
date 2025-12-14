#!/bin/bash

[ -f .env ] && source .env

# have at least 1 monthly copy, delete the oldes
# have at most 1 weekly copy, delete the oldes
# have at most 1 daily copy, delete the oldes  

# add some sort of compression afterwards
# add some simple flag that allows for revocery from this command

src="$LAPTOP_LOCATION:"
destination="$HOME/laptop_backups/home_backup"
flags="-azPh"

include=(
    "docs"
    "downloads"
    "pics"
    )

excludes=(
    "docs/backups"
    ".git"
    ".cache"
    "*.dat"
)

rsync "$flags" -n --delete -e "ssh -i $SSH_KEY_PATH" "${excludes[@]/#/--exclude=}" "${include[@]/#/$src}" "$destination"

