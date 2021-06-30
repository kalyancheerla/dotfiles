#!/usr/bin/env bash

# included directories for backup
declare -a INCFOLDERS=(
"$HOME/Desktop"
"$HOME/Downloads"
"$HOME/docs"
"$HOME/projects"
"$HOME/repos"
"$HOME/tmp"
)

# sync data as is to the $BACKUP_DIR global env variable
[ -d "$BACKUP_DIR" ] && rsync -av --progress --delete "${INCFOLDERS[@]}" "${BACKUP_DIR}"
