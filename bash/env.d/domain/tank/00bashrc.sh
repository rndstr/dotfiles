export LAMPREY_HOME="${HOME}/lamprey"
if [ "$HOSTNAME" = "lamprey" ]; then
  export LAMPREY_HOME="$HOME"
else
  # check whether we are mounted
  if ! $(grep "${LAMPREY_HOME}" /proc/mounts >/dev/null 2>&1) ; then
    export LAMPREY_HOME=""
  fi
fi

export PATH=${PATH}:${LAMPREY_HOME}/bin
