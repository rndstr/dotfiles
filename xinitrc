xrdb -merge ~/.Xresources
xmodmap $HOME/.Xmodmap
xbindkeys
$HOME/.dotfiles/bin/synaptics-toggle
$HOME/.dotfiles/bin/trackpoint

udiskie --tray &
nm-applet --sm-disable &
batterymon &
# google-musicmanager
# sudo blueman-applet

exec awesome
