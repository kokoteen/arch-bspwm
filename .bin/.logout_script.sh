#!/bin/bash

#get cfg
p=$(echo -e "1 Cancel\n2 Shutdown\n3 Restart\n4 Suspend " | rofi -dmenu -p "Select Command > " | awk '{print $1}')

case $p in
	"2") systemctl poweroff ;;
	"3") systemctl reboot ;;
	"4") systemctl suspend ;;
	*) exit 1 ;;
esac

