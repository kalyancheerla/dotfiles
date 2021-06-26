# ~/.bash_profile: executed by the bash for login shells.

# Add `~/bin` to the `$PATH` if exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Load .bashrc if exists
# please leave this at last
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
