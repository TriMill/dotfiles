#!/bin/bash

printhelp() {
	printf "Usage: $0 <repo> [<args>]\\n  -h: Print this help message\\n  -d <dir>: Directory to use for the repository (defaults to \$HOME/dotfiles)\\n  -p [<file>]: Install packages from file (defaults to \$HOME/PACKAGELIST if no file specified)\\n  -m <package>: Use an AUR helper to install packages (must be syntax-compatible with pacman)\\n"
}

[ "$1" = "-h" ] && printhelp && exit

[ $UID -ne 0 ] && printf "Error: this script must be run as root.\\n" && exit 1;

[ $# = 0 ] && printf "No repo specified.\\nUse $0 -h for help.\\n" && exit 1
repo=$1
shift

while getopts ":hd:p:m:" opt; do
	case $opt in
		h ) printhelp && exit ;;
		d ) dotdir=$OPTARG ;;
		p ) paclist=$OPTARG && [ -z $paclist ] && paclist="$HOME/PACKAGELIST" ;;
		m ) manager=$OPTARG ;;
		* ) printf "Unrecognised flag -$OPTARG\\nUse $0 -h for help.\\n" && exit 1 ;;
	esac
done
[ -z $dotdir ] && dotdir="$HOME/dotfiles"
if [ -z $manager ]; then
	manager="pacman"
fi

/usr/bin/git clone --bare $repo $dot_dir
/usr/bin/git --git-dir=$dot_dir --work-tree="$HOME" checkout

if [ -e $paclist ]; then
	$manager -S --noconfirm --needed $(cat $paclist) >/dev/null 2>&1
else
	printf "Error: file $paclist not found.\\n"
	exit 1;
fi
