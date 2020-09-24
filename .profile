#
# ~/.profile
#

## Default programs ##
export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"
export DIFFPROG="/usr/bin/nvim"
export PAGER="/usr/bin/less"
export VIEWER="/usr/bin/zathura"
export FILE="/usr/bin/thunar"
export TERMINAL="/usr/bin/alacritty"
export BROWSER="/usr/bin/firefox"
export TUIR_BROWSER="/usr/bin/qutebrowser"
export LC_ALL="en_US.UTF-8"

## Colors ##
export I3C_BLACK="#1f2124"
export I3C_GREEN="#97bd5e"
export I3C_YELLOW="#f0c767"
export I3C_RED="#cc5c5c"
export I3C_BLUE="#789ebf"
export I3C_CYAN="#82bfb3"
export I3C_WHITE="#bbbfbc"
export I3C_ORANGE="#de7e54"

## Clean up ##
export LESSHISTFILE="-"
export WGETRC="$HOME/.config/wget/wgetrc"
export ZDOTDIR="$HOME/.config/zsh"
export XDG_DATA_DIRS="$HOME/.local/share:/usr/local/share:/usr/share"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export WINEPREFIX="$HOME/.config/wine"

## Enable libnotify from cron ##
touch $HOME/.local/share/Xdbus
chmod 600 $HOME/.local/share/Xdbus
env | grep DBUS_SESSION_BUS_ADDRESS > $HOME/.local/share/Xdbus
echo 'export DBUS_SESSION_BUS_ADDRESS' >> $HOME/.local/share/Xdbus

# Load bashrc
[ -f "$HOME/.bashrc" ] && . $HOME/.bashrc

if [ "$(tty)" = "/dev/tty1" ]; then
	exec startx
fi
