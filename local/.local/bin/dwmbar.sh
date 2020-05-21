#!/bin/sh

sep=" | "

while :; do
	weather="$(head "${XDG_DATA_HOME:-$HOME/.local/share}/weatherreport")"
	mem=" $(free -h | awk '/^Mem:/ {print $3}' | sed "s/Gi/G/g")"
	temp=" $(sensors | awk '/^Tdie/ {print $2}' | sed "s/+//")"
	vol_percent="$(pamixer --get-volume-human)"
	if [ "$vol_percent" = "muted" ]; then
		vol=" ${vol_percent}"
	else
		vol=" ${vol_percent}"
	fi
	date=" $(date '+%b %d (%a)')"
	time=" $(date '+%I:%M %p')"
	xsetroot -name " ${weather}${sep}${mem}${sep}${temp}${sep}${vol}${sep}${date}${sep}${time}"
    sleep 30s
done
