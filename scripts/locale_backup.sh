#!/bin/bash

# have at most two weekly copys, delete the oldes
# have at most three daily copys, delete the oldes  

# add some sort of compression afterwards
# add some simple flag that allows for revocery from this command

locale_backup () {
    local destination=docs/backups/
    local excludes=(
        "docs/backups" # very important to have this
        "git"
        ".cache" 
        ".local"
        ".mozilla"
        ".zotero"
        ".npm"
        "docs/NTNU/prosjektoppgave_semester/parallelberegninger"
        "docs/NTNU/prosjektoppgave_semester/prosjekt_oppgave_notater")

    rsync -azPh --delete "${excludes[@]/#/--exclude=}" $HOME $destination
}
