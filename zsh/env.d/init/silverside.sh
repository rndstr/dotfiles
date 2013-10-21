#export PROMPT_HOSTNAME_COLOR='1;37m'
#export PROMPT_SUFFIX_COUNT=1
export DOTFILES_ENV_DIST='arch'
export DOTFILES_ENV_DOMAIN='tank'
export DOTFILES_ENV_TYPE='laptop'

export ANDROID_HOME=$HOME/apps/android-studio/sdk
PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$HOME/apps/android-studio/bin:$HOME/apps/android-studio/genymotion


# rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -r "$HOME/.rvm/scripts/completion" ]] && source "$HOME/.rvm/scripts/completion"
PS1="\$($HOME/.rvm/bin/rvm-prompt) $PS1"

PATH=/usr/local/heroku/bin:$PATH
