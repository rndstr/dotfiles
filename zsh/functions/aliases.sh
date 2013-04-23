
alias pm="sudo pacman"

alias ls="ls -Fh --color=auto" # default ls options
alias la="ls -la"
alias l="ls -l"
alias lls="ls -lSr" # sort by size reverse
alias llt="ls -ltr" # sort by time reverse
alias ,="cd .."
alias ,,='cd .. && ls -l'
alias du="du -sh"

alias grep="grep --color=auto"
alias more="more -r" # colorize

alias h="history | grep -i" # or use ctrl-r
alias hclear='history -c; clear'

alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias vi='vim -X -p'

# set $HOME of target user
alias sudo="sudo -H"

alias s="screen"
alias ss="screen -S "
alias sl="screen -list"
alias sr="screen -d -r"
alias sx="screen -x"

alias psg="ps -awef |grep"
alias diff="colordiff -bBur"

function f { find . -iname "*$1*"; }
function g { grep -Ri $* *; }

eptlive="mplayer http://stream-eng.pokerstars.tv/pxpkrlive-live/pokerstarslive_eng_500k"
reptlive="mplayer http://stream-eng.pokerstars.tv/pxpkrlive-live/pokerstarslive_eng_500k -dumpstream -dumpfile"

