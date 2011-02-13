alias yum="sudo yum"
function istart { sudo /etc/init.d/$* start; }
function irestart { sudo /etc/init.d/$* restart; }
function istop { sudo /etc/init.d/$* stop; }
function istatus { sudo /init/init.d/$* status; }

