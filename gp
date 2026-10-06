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
    launchctl bootstrap $U $A.pangps.plist 2>/dev/null
    launchctl bootstrap $U $A.pangpa.plist 2>/dev/null
    echo "GlobalProtect started" ;;
  status)
    launchctl list | grep -i paloaltonetworks.gp || echo "GlobalProtect not running" ;;
  *) echo "Usage: gp start|stop|status"; exit 1 ;;
esac
