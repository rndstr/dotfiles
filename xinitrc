xrdb -merge ~/.Xresources
xmodmap $HOME/.Xmodmap
xbindkeys
$HOME/.dotfiles/bin/synaptics-toggle
$HOME/.dotfiles/bin/trackpoint

exec awesome
