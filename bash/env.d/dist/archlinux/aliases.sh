alias pm="sudo pacman"
alias aurget="sudo --asroot"
function istart { sudo /etc/rc.d/$* start; }
function irestart { sudo /etc/rc.d/$* restart; }
function istop { sudo /etc/rc.d/$* stop; }

