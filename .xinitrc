#!/bin/sh

userresources=$HOME/.config/Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
xprofile=$HOME/.xprofile

# merge in defaults and keymaps

[ -f $sysresources ] &&  xrdb -merge $sysresources
[ -f $userresources ] &&  xrdb -merge $userresources
[ -f $usermodmap ] &&  xmodmap "$usermodmap"
[ -f $sysmodmap  ] &&  xmodmap "$sysmodmap "

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# runs xprofile as an X autostart
[ -f $xprofile ] && . $xprofile

exec dwm
