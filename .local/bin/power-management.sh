#!/bin/sh

choices="reboot\nshutdown\nsuspend\nhibernate"

chosen=$(echo -e "$choices" | dmenu -i)

case "$chosen" in
    reboot) systemctl reboot;;
    shutdown) systemctl poweroff;;
    suspend) systemctl suspend;;
    hibernate) systemctl hibernate;;
esac
