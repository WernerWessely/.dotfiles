# Set delay to 200 ms, repeat to 60 Hz:
xset r rate 200 60

# Switch esc and capslock:
setxkbmap -option caps:swapescape

# Enable tap click in touchpad:
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1

# Start i3:
exec i3
