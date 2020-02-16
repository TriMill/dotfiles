#!/bin/bash

# Confirm before copy
alias cp="cp -i"
# Human-readable sizes
alias df='df -h'
alias free='free -m'

# shorten ls commands
alias ll='ls -l'
alias lla='ls -la'
alias ldir='ls -la | grep ^d'

# pacman tools
alias pacls='pacman -Qe | column -t'
alias genpaclist='sudo pacman -Qqe > ~/.packagelist; echo "Regerated package list for" `pacman -Qqe | wc -l` "packages"'

# shorten python
alias py='python'

# restart shell without open/close
alias rebash='source ~/.bashrc'

# print the time in different formats
alias datetime='date +"%Y-%m-%d %I:%M:%S %p"'
alias timestamp='date +"%Y-%m-%dT%H.%M.%S"'

# allow nav to change the working directory
alias nav='. ~/.scripts/nav-prealias'
