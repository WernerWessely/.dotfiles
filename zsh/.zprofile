# Start x if we're no yet in an x session and on tty1:
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx
fi
