#!/bin/bash

# Confirm before copy
alias cp="cp -i"

# add color
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias ccat='highlight --out-format=ansi'	
	
# shorten commands
alias ls='ls -hN --color=auto --group-directories-first'
alias ll='ls -l'
alias lla='ls -lA'
alias ldir='ls -la | grep ^d'
alias mkd='mkdir -pv'
alias iplocate='dig @resolver1.opendns.com ANY myip.opendns.com +short'

# shortcuts
alias ..='cd ..'
alias conf='cd ~/.config'
alias docs='cd ~/documents'
alias bin='cd ~/.local/bin'
alias v-i3='nvim ~/.config/i3/config'
alias v-i3b='nvim ~/.config/i3blocks/config'
alias v-ba='nvim ~/.bash_aliases'
alias v-brc='nvim ~/.bashrc'
alias v-nv='nvim ~/.config/nvim/init.vim'
alias v-pr='nvim ~/.profile'

# pacman tools
alias pacls='pacman -Qe | column -t'
alias genpaclist='pacman -Qqe > ~/.packagelist; echo "Regerated package list for" `pacman -Qqe | wc -l` "packages"'
alias sp='sudo pacman'

# shorten python
alias py='python'

# restart shell without open/close
alias rebash='source ~/.bashrc'

# print the time in different formats
alias datetime='date +"%Y-%m-%d %I:%M:%S %p"'
alias timestamp='date +"%Y-%m-%dT%H.%M.%S"'

# dotfile repo
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# git commands
alias g='git'
alias gs='git status'
alias gadd='git add'
alias grm='git rm'
alias gcommit='git commit'
alias gpush='git push'
alias ghelp='git --help'
alias gclone='git clone'

# youtube-dl
alias ytdl="youtube-dl -f bestvideo+bestaudio"
alias ytdl-a="youtube-dl --extract-audio --audio-format=mp3"
