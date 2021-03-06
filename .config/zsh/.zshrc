#!/bin/zsh
#
# ~/.zshrc
#

export PATH="$PATH:$HOME/.gem/ruby/2.7.0/bin/:$HOME/.cargo/bin"

ZSH_DISABLE_COMPFIX=true

autoload -Uz compinit && compinit
zmodload zsh/zprof

[ -r "$ZDOTDIR/.aliases" ] && source "$ZDOTDIR/.aliases"
[ $NOEXIT ] && alias exit="echo Exiting is disabled"

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.config/zsh/history

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

function zshplugintimes() {
	for plugin ($plugins); do
		timer=$(($(date +%s%N)/1000000))
		if [ -f $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh ]; then  
			source $ZSH_CUSTOM/plugins/$plugin/$plugin.plugin.zsh  
		elif [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then  
			source $ZSH/plugins/$plugin/$plugin.plugin.zsh  
		fi  
		now=$(($(date +%s%N)/1000000))
		elapsed=$(($now-$timer))  
		echo $elapsed":" $plugin  
	done 
}

setopt autocd
setopt vi
tabs 4

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$HOME/.config/zsh/custom"
ZSH_THEME="customtheme"
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="yyyy-mm-dd"

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

todomsg=$(todo)
[ "$todomsg" != "" ] && printf "TODO: \n%s\n" "$todomsg"
return 0
