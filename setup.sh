#!/usr/bin/env bash

# Set dotfiles path as present working dir
DOTFILESPATH="$PWD"

# array of files and directories to symlink
declare -a DOTFILES=(
# Files
".bash_profile"
".bashrc"
".bash_prompt"
".exports"
".aliases"
".functions"
".extras"
".inputrc"
".tmux.conf"
".vimrc"
".gitconfig"
".gdbinit"
# Directories
".vim"
".bin"
)

echo "[*] Setting-up symlinks for dotfiles started..."
# Check for no. of args
if [ $# -gt 1 ]; then
    echo "[*] >1 positional arguments are provided"
    exit -1
fi

# Make sure if 1st arg present it is '-f' or '--force'
ARG_FORCE=${1:-NONE}
if [ $ARG_FORCE == "--force" -o $ARG_FORCE == "-f" ]; then
    echo "[*] add force symlinking flag"
    # ln symlink options
    # -n treat dir sym links as normal files
    # -f force creation of sym links
    LN_OPTS="-nf"
elif [ $ARG_FORCE != "NONE" ]; then
    echo "[*] bad options were provided"
    exit -2
fi

# Loop through the list
for any in "${DOTFILES[@]}"; do
    # if no force option is present, skip the re-symlinking
    if [ -h "$HOME/$any" -a -z "$LN_OPTS" ]; then
        echo "[-] skipping $any"
        continue
    # move the normal files/directories (not symlinks) as .orig
    elif [ \( ! -h "$HOME/$any" \) -a \( -f "$HOME/$any" -o  -d "$HOME/$any" \) ]; then
        # remove .orig files/directories if present
        rm -rf "$HOME/$any.orig"
        echo "[+] moving $HOME/$any -> $HOME/$any.orig"
        mv "$HOME/$any" "$HOME/$any.orig"
    fi
    # Create the symlink
    echo "[+] symlinking $DOTFILESPATH/$any -> $HOME/$any"
    ln $LN_OPTS -s "$DOTFILESPATH/$any" "$HOME/$any"
done
