#!/bin/sh

sep=" | "

# Some extra icons: 

kerver=" $(uname -r)"

checkupdates | wc -l > "${HOME}/.local/share/arch_updates"

while :; do
	weather="$(head ${HOME}/.local/share/weatherreport)"
	updates=" $(head ${HOME}/.local/share/arch_updates)"
	# mem=" $(free -h | awk '/^Mem:/ {print $3}' | sed "s/Gi/G/g")"
	# temp=" $(sensors | awk '/^Tdie/ {print $2}' | sed "s/+//")"
	vol_percent="$(pamixer --get-volume-human)"
	if [ "$vol_percent" = "muted" ]; then
		vol=" ${vol_percent}"
	else
		vol=" ${vol_percent}"
	fi
	date=" $(date '+%b %d (%a)')"
	time=" $(date '+%I:%M %p')"
	xsetroot -name " ${kerver}${sep}${updates}${sep}${weather}${sep}${vol}${sep}${date}${sep}${time}"
	sleep 1m
done
