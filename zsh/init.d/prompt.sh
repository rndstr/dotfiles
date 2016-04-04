source ~/.zsh/git-prompt/zshrc.sh
#PROMPT='%B%m%~%b$(git_super_status) %# '
PROMPT='%{$fg_bold[green]%}*%{$fg_bold[white]%}%M%{$fg_bold[green]%}*%{$reset_color%}%~
%{$reset_color%}%n$(git_super_status) \$ '

ZSH_THEME_GIT_PROMPT_PREFIX=
ZSH_THEME_GIT_PROMPT_SUFFIX=
ZSH_THEME_GIT_PROMPT_SEPARATOR=' '
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}+"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}C"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[yellow]%}%%"
ZSH_THEME_GIT_PROMPT_UNTRACKED=?
