#!/usr/bin/env bash

DOTFILESPATH="$HOME/repos/dotfiles"
declare -a DOTFILES=(
".bash_profile"
".bashrc"
".bash_prompt"
".exports"
".aliases"
".functions"
".extras"
".inputrc"
".tmux.conf"
".gdbinit")

echo "Sourcing dotfiles started..."
for file in "${DOTFILES[@]}"; do
    if [ -f "$HOME/$file" ]; then
        if [ -h "$HOME/$file" ]; then
            echo "[-] skipping $file"
        else
            echo "[+] moving $HOME/$file -> $HOME/$file.orig"
            mv "$HOME/$file" "$HOME/$file.orig"
            echo "[+] symlinking $DOTFILESPATH/$file -> $HOME/$file"
            ln -s "$DOTFILESPATH/$file" "$HOME/$file"
        fi
    else
        echo "[+] symlinking $DOTFILESPATH/$file -> $HOME/$file"
        ln -s "$DOTFILESPATH/$file" "$HOME/$file"
    fi
done
