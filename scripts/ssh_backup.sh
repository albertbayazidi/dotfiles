#!/bin/bash

# have at most two weekly copys, delete the oldes
# have at most three daily copys, delete the oldes  

# add some sort of compression afterwards
# add some simple flag that allows for revocery from this command

ssh_backup () {
    local destination=docs/backups/system
    excludes=(
        "$HOME/docs/backups" # this is very important
        "$HOME/git"
        "$HOME/.cache"
        "$HOME/.local"
        "$HOME/.mozilla"
        "$HOME/.npm"
        "$HOME/docs/NTNU/prosjektoppgave_semester/prosjekt_oppgave_notater"
        "$HOME/docs/NTNU/prosjektoppgave_semester/parallelberegninger"
        "/tmp"
        "/dev"
        "/proc"
        "/sys"
        "/run"
        "/mnt"
        "/media"
        "/lost+found"
        "opt/ferdium")

    sudo rsync -azPh --delete "${excludes[@]/#/--exclude=}" / $destination
}

