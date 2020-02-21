#!/bin/bash
#
# ~/.bashrc
#


# Set environment variables
export LC_ALL="en_US.UTF-8"
export BROWSER="firefox"

[[ $- != *i* ]] && return # Exit if shell is not interactive

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion # Run bash-completion script if it exists

[ -r ~/.bash_aliases ] && . ~/.bash_aliases # Inject aliases from separate alias file

# Set prompt
if [ "${EUID}" == 0 ]; then
	# If user is root
	PS1=$(
		style ps1 reset magenta; printf "[\\D{%%H:%%M}] "; 
		style ps1 light red; printf "[\\\\u@\\h"; 
		style ps1 light yellow; printf " \\W"; 
		style ps1 light red; printf "]\\$";
		style ps1 reset; printf " "
	)
else
	# Else
	PS1=$(
		style ps1 reset magenta; printf "[\\D{%%H:%%M}] "; 
		style ps1 light green; printf "[\\\\u@\\h"; 
		style ps1 white; printf " \\W"; 
		style ps1 light green; printf "]\\$";
		style ps1 reset; printf " "
	)
fi

# add color to man pages
man() {
	env \
	LESS_TERMCAP_md=$'\e[1;36m' \
	LESS_TERMCAP_me=$'\e[0m' \
	LESS_TERMCAP_se=$'\e[0m' \
	LESS_TERMCAP_so=$'\e[1;92m' \
	LESS_TERMCAP_ue=$'\e[0m' \
	LESS_TERMCAP_us=$'\e[1;35m' \
	man "$@"
}

xhost +local:root > /dev/null 2>&1

complete -cf sudo # Add completion to sudo

# Set terminal options
# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend
shopt -s autocd

