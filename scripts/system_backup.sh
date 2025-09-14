#!/bin/bash

# have at most two weekly copys, delete the oldes
# have at most three daily copys, delete the oldes  

# add some sort of compression afterwards
# add some simple flag that allows for revocery from this command

system_backup () {
    local destination="$HOME/docs/backups/system"
    local source="/"
    local flags="-azPhHS --numeric-ids --one-file-system"
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
    sudo rsync $flags --delete "${excludes[@]/#/--exclude=}" $source $destination
}
