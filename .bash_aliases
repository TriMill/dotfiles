#!/bin/bash

# Confirm before copy
alias cp="cp -i"

# Human-readable sizes
alias df='df -h'
alias du='du -h'
alias free='free -m'

# add color
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias ccat='highlight --out-format=ansi'	
	
# shorten commands
alias ls='ls -hN --color=auto --group-directories-first'
alias ll='ls -l'
alias lla='ls -la'
alias ldir='ls -la | grep ^d'
alias mkd='mkdir -pv'
alias r='ranger'
alias iplocate='dig @resolver1.opendns.com ANY myip.opendns.com +short'

# shortcuts
alias conf='cd ~/.config'
alias docs='cd ~/documents'
alias bin='cd ~/.local/bin'
alias v-i3='vim ~/.config/i3/config'
alias v-i3b='vim ~/.config/i3blocks/config'
alias v-ba='vim ~/.bash_aliases'
alias v-brc='vim ~/.bashrc'

# pacman tools
alias pacls='pacman -Qe | column -t'
alias genpaclist='sudo pacman -Qqe > ~/.packagelist; echo "Regerated package list for" `pacman -Qqe | wc -l` "packages"'
alias sp='sudo pacman'

# shorten python
alias py='python'

# restart shell without open/close
alias rebash='source ~/.bashrc'

# print the time in different formats
alias datetime='date +"%Y-%m-%d %I:%M:%S %p"'
alias timestamp='date +"%Y-%m-%dT%H.%M.%S"'

# allow nav to change the working directory
alias nav='. ~/.local/bin/nav-prealias'
