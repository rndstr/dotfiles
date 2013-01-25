
alias leechmp3="cd /20media/audio/_new && wget"

alias vncfinkpad="vncviewer -compresslevel 9 -quality 9 10.0.0.20"

function addeng() { echo $* >> $LAMPREY_HOME/ENGLISH; }

# --- devtodo ---
if [[ -x /usr/bin/devtodo && -n "$LAMPREY_HOME" ]]; then
  # global mode for devtodo
  #alias gtodo="todo -g ~/.todo_global -G"

  # real todo, pc stuff
  alias ptodo="todo --global-database $LAMPREY_HOME/.todo_pc -G"

  # reminder for repeating commands
  alias rtodo="todo --global-database $LAMPREY_HOME/.todo_remind -G"
fi

# --- find ---
alias fmp3="cat /20media/audio/music/.listing | grep -i"
function fmovie() {
  cat /20media/video/.movielisting* | grep -i $*
  lsre -ld /0Amovie 0 -ld /0Amovie/ARCHIVE/ 1 -ld /21movie 0 -ld /22movie 0 -ld /23movie 0 | grep -i $*
}


# --- ftp ---

# Upload file to plrf.org
function sendplrf() {
  ncftpput -f $LAMPREY_HOME/.ncftp/plrf.org_public.cfg / $*
  echo " ------------------"
  for i in $*
  do
    echo "http://plrf.org/pub/`basename $i`"
  done
}
