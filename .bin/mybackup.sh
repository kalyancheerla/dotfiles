#!/usr/bin/env bash

# included directories for backup
declare -a INCFOLDERS=(
"$HOME/dev"
"$HOME/projects"
"$HOME/repos"
"$HOME/self"
"$HOME/tmp"
)

# sync data as is to the $BACKUP_DIR global env variable
[ -d "$BACKUP_DIR" ] && rsync -aczvh --progress --delete "${INCFOLDERS[@]}" "${BACKUP_DIR}"
