#!/bin/bash
#
# ~/.bashrc
#

# Set language information
export LC_ALL="en_US.UTF-8"
# Add ~/.scripts to path
export PATH=$PATH:~/.scripts
# Exit if shell is not interactive
[[ $- != *i* ]] && return
# Run bash-completion script if it exists
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
# Inject aliases
[ -r ~/.bash_aliases ] && . ~/.bash_aliases

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
if ${use_color} ; then
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	# Set prompt
	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\e[35m\][\D{%H:%M}] \[\e[1;31m\][\u\[\e[31;1m\]@\h\[\e[33;1m\] \W\[\e[1;31m\]]\$\[\e[0m\] '
	else
		PS1='\[\e[35m\][\D{%H:%M}] \[\e[1;32m\][\u\[\e[32;1m\]@\h\[\e[37;1m\] \W\[\e[1;32m\]]\$\[\e[0m\] '
	fi

	# Enable colors for programs
	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'

	
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
else
	if [[ ${EUID} == 0 ]] ; then
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh

xhost +local:root > /dev/null 2>&1

# Add completion to sudo
complete -cf sudo

# Set terminal options
# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend
