# Usage: <videofile>
mplayerscreenies () {
    for f in $*; do
        suffix=${f%.*}.png
        for i in $(seq 1 6); do
            mplayer -nosound -ss $i -vf screenshot -frames 1 -vo png:z=9 $f
            padding=$(printf %03d ${i})
            mv 00000001.png $padding-$suffix
        done
    done
}

