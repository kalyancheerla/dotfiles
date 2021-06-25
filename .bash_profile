# ~/.bash_profile: executed by the bash for login shells.

# Add `~/bin` to the `$PATH` if exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Load .bashrc if exists
# please leave this at last
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
