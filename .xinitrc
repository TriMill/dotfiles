#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

export QT_AUTO_SCREEN_SCALE_FACTOR=1

[[ -f "$HOME/.Xresources" ]] && xrdb -merge "$HOME/.Xresources"

[[ -f "$HOME/.Xmodmap" ]] && xmodmap "$HOME/.Xmodmap"

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

xset r rate 600 25 &
xrandr --dpi 196 --output eDP1 --mode 3840x2160 --pos 4480x360 --output DP1 --primary --mode 2560x1440 --pos 0x0 --scale 1.75 &

xbindkeys &

if [ "$2" != "clean" ]; then
	xbacklight -set 80 &
	picom -b &
	rand-wallpaper &
	nm-applet &
	i3-battery-popup -n -t 30s &
fi

if [ -z "$2" ] || [ "$2" = "i3" ] || [ "$2" = "clean" ]; then
	exec i3
elif [ "$2" = "xmonad" ]; then
	xmonad
fi
