#!/bin/sh

#rofi options
run_rofi()
{
    rofi -dmenu -theme themes/logout #-p "$@" # dodati opciju prompt u temi
}
#  
#get cfg
shutdown=""
suspend=""
reboot=""

p=$(printf "%s\n" "$shutdown" "$reboot" "$suspend" | run_rofi | awk '{print $1}')


case $p in
	"$shutdown") 	systemctl poweroff ;;
	"$reboot") 		systemctl reboot ;;
	"$suspend") 	systemctl suspend ;;
	*) 				exit 1 ;;
esac

