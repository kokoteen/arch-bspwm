#!/bin/bash

#rofi options
opt='''-width 16 
	   -lines 5 
	   -dmenu 
	   -p
	'''

#get cfg
p=$(echo -e "1 Cancel\n2 Shutdown\n3 Restart\n4 Suspend " | rofi $opt "Select Command > " | awk '{print $1}')

case $p in
	"2") systemctl poweroff ;;
	"3") systemctl reboot ;;
	"4") systemctl suspend ;;
	*) exit 1 ;;
esac

