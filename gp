#!/bin/bash
# Usage: gp start|stop|status
U=gui/$(id -u)
A=/Library/LaunchAgents/com.paloaltonetworks.gp
D=/Library/LaunchDaemons/com.paloaltonetworks.gp.pangpsd.plist
case "$1" in
  stop)
    launchctl bootout $U $A.pangpa.plist 2>/dev/null
    launchctl bootout $U $A.pangps.plist 2>/dev/null
    sudo launchctl bootout system $D 2>/dev/null
    echo "GlobalProtect stopped" ;;
  start)
    sudo launchctl bootstrap system $D 2>/dev/null
    # enable just long enough to load, then disable again so it won't autostart at login
    for s in pangps pangpa; do
      launchctl enable $U/com.paloaltonetworks.gp.$s
      launchctl bootstrap $U $A.$s.plist 2>/dev/null
      launchctl disable $U/com.paloaltonetworks.gp.$s
    done
    echo "GlobalProtect started" ;;
  status)
    launchctl list | grep -i paloaltonetworks.gp || echo "GlobalProtect not running" ;;
  *) echo "Usage: gp start|stop|status"; exit 1 ;;
esac
