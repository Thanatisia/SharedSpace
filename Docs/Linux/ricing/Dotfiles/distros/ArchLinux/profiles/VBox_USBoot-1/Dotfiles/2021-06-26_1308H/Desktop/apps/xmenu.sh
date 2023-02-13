#!/bin/sh

cat <<EOF | xmenu | sh &
Terminal
	urxvt				urxvt
	st					st

Applications
	IMG:$HOME/Desktop/portable/repos/tar/utilities/xmenu/xmenu-4.5.5/mod-20210509-1229H/icons/web.png		Web Browser		firefox
	IMG:$HOME/Desktop/portable/repos/tar/utilities/xmenu/xmenu-4.5.5/mod-20210509-1229H/icons/gimp.png		Image editor	gimp

Terminal Applications
	Vim (urxvt)			urxvt -e vimopen.sh

Shutdown		poweroff
Reboot			reboot
Lock			sleep 0.5s && slock
EOF
