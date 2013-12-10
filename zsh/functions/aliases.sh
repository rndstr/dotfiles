
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

alias eptlive="mplayer http://stream-eng.pokerstars.tv/pxpkrlive-live/pokerstarslive_eng_500k"
alias reptlive="mplayer http://stream-eng.pokerstars.tv/pxpkrlive-live/pokerstarslive_eng_500k -dumpstream -dumpfile"


alias rake="noglob rake"

function c { echo "scale=3; $*" | bc -l; }

alias fmp3="cat /20media/audio/music/.listing | grep -i"
function fmovie() {
  cat /20media/video/.movielisting* | grep -i $*
  lsre -ld /0Amovie 0 -ld /0Amovie/ARCHIVE/ 1 -ld /21movie 0 -ld /22movie 0 -ld /23movie 0 -ld /24movie 0 | grep -i $*
}

