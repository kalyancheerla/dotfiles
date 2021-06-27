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
    if [ -h "$HOME/$file" ]; then
        echo "[-] skipping $file"
        continue
    elif [ -f "$HOME/$file" ]; then
        echo "[+] moving $HOME/$file -> $HOME/$file.orig"
        mv "$HOME/$file" "$HOME/$file.orig"
    fi
    echo "[+] symlinking $DOTFILESPATH/$file -> $HOME/$file"
    ln -s "$DOTFILESPATH/$file" "$HOME/$file"
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
find "$HOME/.vim" -name ".gitkeep" -size 0c -delete
