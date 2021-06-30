#!/usr/bin/env bash

DOTFILESPATH="$HOME/projects/dotfiles"
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
".vimrc"
".gitconfig"
".gdbinit"
".vim"
"bin")

echo "Symlinking dotfiles started..."
for any in "${DOTFILES[@]}"; do
    if [ -h "$HOME/$any" ]; then
        echo "[-] skipping $any"
        continue
    elif [ -f "$HOME/$any" ]; then
        echo "[+] moving $HOME/$any -> $HOME/$any.orig"
        mv "$HOME/$any" "$HOME/$any.orig"
    fi
    echo "[+] symlinking $DOTFILESPATH/$any -> $HOME/$any"
    ln -s "$DOTFILESPATH/$any" "$HOME/$any"
done
