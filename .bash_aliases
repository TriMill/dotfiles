#!/bin/bash
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less
alias ll='ls -l'
alias lla='ls -la'
alias ldir='ls -la | grep ^d'
alias pacls='pacman -Qe | column -t'
alias py='python'
alias rebash='source ~/.bashrc'
alias datetime='date +"%Y-%m-%d %I:%M:%S %p"'
alias timestamp='date +"%Y-%m-%dT%H.%M.%S"'
alias genpaclist='sudo pacman -Qqe > ~/.packagelist; echo "Regerated package list for" `pacman -Qqe | wc -l` "packages"'

