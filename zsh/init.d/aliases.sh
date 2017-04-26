alias audio.hdmi='pacmd set-card-profile 0 output:hdmi-stereo+input:analog-stereo'
alias audio.analog='pacmd set-card-profile 0 output:analog-stereo+input:analog-stereo'


alias pm="sudo pacman"
alias doc="docker-compose"
alias k="kubectl"

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

alias h="history -1000 | grep -i" # or use ctrl-r
alias hclear='history -c; clear'

alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias vi='vim -X -p'

# set $HOME of target user
alias sudo="sudo -H"

alias t="tmux"
alias ta="tmux attach -t"

alias psg="ps -awef |grep"
alias diff="colordiff -bBur"

f() { find . -iname "*$1*"; }
g() { grep -Ri $* *; }

alias eptlive="mplayer http://stream-eng.pokerstars.tv/pxpkrlive-live/pokerstarslive_eng_500k"
alias reptlive="mplayer http://stream-eng.pokerstars.tv/pxpkrlive-live/pokerstarslive_eng_500k -dumpstream -dumpfile"

alias weather="curl wttr.in/Zurich"

alias rake="noglob rake"

c() { echo "scale=3; $*" | bc -l; }

alias fmp3="cat /20media/audio/music/.listing | grep -i"
fmovie() {
  lsre -ld /21movie 0 -ld /22movie 0 -ld /23movie 0 -ld /24movie 0 -ld /26movie 0| grep -i $*
}

