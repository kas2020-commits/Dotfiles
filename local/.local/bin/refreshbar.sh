#!/bin/sh

kill "$(pstree -lp | grep -- -dwmbar.sh\([0-9] | sed "s/.*sleep(\([0-9]\+\)).*/\1/")"
