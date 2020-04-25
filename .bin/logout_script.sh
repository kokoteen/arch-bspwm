#!/bin/sh

#rofi options
run_rofi()
{
    rofi -dmenu -theme themes/logout -p "$@"
}

#get cfg
p=$(printf "%s\n" "1 Cancel" "2 Shutdown" "3 Reboot" "4 Suspend " | run_rofi "Select Command > " | awk '{print $1}')


case $p in
	"2") systemctl poweroff ;;
	"3") systemctl reboot ;;
	"4") systemctl suspend ;;
	*) exit 1 ;;
esac

