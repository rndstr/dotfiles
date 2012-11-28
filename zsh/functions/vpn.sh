function thromium {
    export SOCKS_SERVER=lamprey:1080
    export SOCKS_VERSION=5
    echo ">>> starting tunnel in background"
    ssh -D 1080 -f -C -q -N lamprey &
    PID=$!
    chromium
    echo -n ">>> killing tunnel"
    kill -9 $PID
    echo " [OK]"
}
