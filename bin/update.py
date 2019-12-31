import subprocess
import os
from pydbus import SessionBus

def check_for_updates():
    subprocess.run(["sudo", "/usr/bin/pacman", "-Sy"], stdout=subprocess.PIPE)
    upgrades = subprocess.run(["pacman", "-Qu"], stdout=subprocess.PIPE).stdout.decode('utf-8').split("\n")

    if(len(upgrades) > 1):
        os.environ['DBUS_SESSION_BUS_ADDRESS'] = 'unix:path=/run/user/1000/bus'
        os.environ['DISPLAY'] = ':0'

        bus = SessionBus()
        notifications = bus.get('.Notifications')
        notifications.Notify("update", 0, 'dialog-information', "Updates Available", f"{len(upgrades)-1} packages are able to be upgraded", [], {}, 5000)

if __name__ == "__main__":
    check_for_updates()
