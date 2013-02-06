
PROMPT='\
%{%(?..${fg_bold[red]}%}ret:%?%{${reset_color}%} %{)%}\
%{$fg[cyan]%}%n@%m \
%{$fg[yellow]%}%~%{$reset_color%}\
$(git_prompt_info)%{$reset_color%} \
%# '

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$fg[green]%}"
