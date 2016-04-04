PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -r "$HOME/.rvm/scripts/completion" ]] && source "$HOME/.rvm/scripts/completion"
PS1="\$($HOME/.rvm/bin/rvm-prompt) $PS1"
