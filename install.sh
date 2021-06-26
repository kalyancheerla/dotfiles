#!/usr/bin/env bash

DOTFILES="$HOME/repos/dotfiles"

for file in .{bash_profile,bashrc,bash_prompt,aliases,exports,tmux.conf,gdbinit}; do
    if [ -f "$HOME/$file" ]; then
        mv "$HOME/$file" "$HOME/$file.orig"
    fi
    ln -s "$DOTFILES/$file" "$HOME/$file"
done
