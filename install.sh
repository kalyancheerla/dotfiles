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
".vimrc"
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

echo "Setting up vim directory..."
if [ -d "$HOME/.vim" ]; then
    echo "[+] moving $HOME/.vim -> $HOME/.vim.orig"
    rm -rf "$HOME/.vim.orig"
    mv "$HOME/.vim" "$HOME/.vim.orig"
fi
echo "[+] copying $DOTFILESPATH/.vim -> $HOME/.vim"
cp -r "$DOTFILESPATH/.vim" "$HOME/.vim"
echo "[+] removing gitkeep files"
find "$HOME/.vim" -name '.gitkeep' -size 0c -delete
