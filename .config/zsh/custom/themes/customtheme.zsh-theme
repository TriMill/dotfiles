function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo "$"; fi
}

PROMPT='%(!.%F{9}.%F{10})%n: %{$reset_color%}%c%F{12}$(git_prompt_info)%F{12}$(prompt_char)%{$reset_color%} '
PROMPT2='%_%F{12}:%{$reset_color%} '
ZSH_THEME_GIT_PROMPT_PREFIX="%F{13} ["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
RPROMPT='[%(?.%F{10}.%F{9})%?%{$reset_color%}]'
