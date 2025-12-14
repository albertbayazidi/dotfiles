#!/bin/bash

[ -f .env ] && source .env

# get error since we are trying to rsync on from server on laptop, and the server might not have the read premissions needed to do that to read root folders

# have at most two weekly copys, delete the oldes
# have at most three daily copys, delete the oldes  

# add some sort of compression afterwards
# add some simple flag that allows for revocery from this command

source="$LAPTOP_LOCATION:/"
destination="$HOME/laptop_backups/system_backup"
flags="-azPhHS --numeric-ids --one-file-system"
excludes=(
    "/home/*"
    "/tmp/*"
    "/dev/*"
    "/proc/*"
    "/sys/*"
    "/run/*"
    "/mnt/*"
    "/media/*"
    "/lost+found/*"
    "/opt/ferdium"
)
sudo rsync -n $flags --delete -e "ssh -i $SSH_KEY_PATH" "${excludes[@]/#/--exclude=}" $source $destination

