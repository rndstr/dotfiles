
alias cdn="cd /10movie/BT/noseed"
alias cdu="cd /10movie/BT/upload"
alias leech="cd /pub/leech && wget"
alias leechmp3="cd /pub/leech/mp3 && wget"

alias vncfinkpad="vncviewer -compresslevel 9 -quality 9 10.0.0.20"

function addeng() { echo $* >> $SHAD_HOME/.ENGLISH; }

# --- devtodo ---
if [[ -x /usr/bin/devtodo && -n "$SHAD_HOME" ]]; then
  # global mode for devtodo
  #alias gtodo="todo -g ~/.todo_global -G"

  # real todo, pc stuff
  alias ptodo="todo --global-database $SHAD_HOME/.todo_pc -G"

  # reminder for repeating commands
  alias rtodo="todo --global-database $SHAD_HOME/.todo_remind -G"
fi

# --- find ---
alias fmp3="cat /20media/audio/music/.listing | grep -i"
function fmovie() {
  cat /20media/video/.movielisting* | grep -i $*
  lsre -ld /0Amovie 0 -ld /0Amovie/ARCHIVE/ 1 | grep -i $*
}


# --- ftp ---

# Upload file to plrf.org
function sendplrf() {
  ncftpput -f $SHAD_HOME/.ncftp/plrf.org_public.cfg / $*
  echo " ------------------"
  for i in $*
  do
    echo "http://plrf.org/pub/`basename $i`"
  done
}
