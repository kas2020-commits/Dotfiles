#!/bin/sh

# getforecast() { curl -sf "wttr.in/?format="%l:+%c+%t+%w"" > "${XDG_DATA_HOME:-$HOME/.local/share}/weatherreport" || exit 1 ;}
# getforecast() { curl -sf "wttr.in/?format="%c+%t+%w"" > "${XDG_DATA_HOME:-$HOME/.local/share}/weatherreport" || exit 1 ;}

while :; do
	curl -sf "wttr.in/?format="%c+%t+%w"" > "${HOME}/.local/share/weatherreport"
	sleep 30m
done
