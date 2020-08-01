#!/bin/dash

choices="reboot\nshutdown\nsuspend\nhibernate"

chosen=$(echo "$choices" | dmenu -i -p "Power Manager")

case "$chosen" in
    reboot) systemctl reboot;;
    shutdown) systemctl poweroff;;
    suspend) "$HOME"/.config/i3lock/beut.sh ; systemctl suspend;;
    hibernate)"$HOME"/.config/i3lock/beut.sh ; systemctl hibernate;;
esac
