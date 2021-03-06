function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

function hg_info {
    hg_id=`hg id -n -i -t -B 2>/dev/null`
    # hg_id=`hg id -n -i -B 2>/dev/null`
    # hg_id=`hg id -r . -T "{separate(' ', node|short, rev, topic, tags, activebookmark)}" 2>/dev/null`

    if [ $? -eq 0 ]; then
        if [[ ! $hg_id =~ ^000000000000 ]]; then
            echo $ZSH_THEME_HG_PROMPT_PREFIX$hg_id$ZSH_THEME_HG_PROMPT_SUFFIX;
        fi
    fi
}

# PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%~) $(hg_prompt_info)$(git_prompt_info)%_$(prompt_char)%{$reset_color%} '
PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%~) $(hg_info)$(git_prompt_info)%_$(prompt_char)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "

ZSH_THEME_HG_PROMPT_PREFIX="("
ZSH_THEME_HG_PROMPT_SUFFIX=") "
