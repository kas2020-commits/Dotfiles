#!/bin/sh

getforecast() { curl -sf "wttr.in/?format="%l:+%c+%t+%w"" > "${XDG_DATA_HOME:-$HOME/.local/share}/weatherreport" || exit 1 ;}

while :; do
	getforecast
	sleep 1h
done
