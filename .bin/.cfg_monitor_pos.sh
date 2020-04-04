#!/bin/bash

#rofi options
opt='''-width 17 
	   -lines 6 
	   -dmenu 
	   -p
	'''

#cancel mirror mode
[ $(grep -w mirror_mode $HOME/.monitor_position| awk '{print $2}') -eq "1" ] && echo -e "1 Do it!" | rofi $opt "Cancel Mirror Mode" && sed -i "s/mirror_mode 1/mirror_mode 0/" $HOME/.monitor_position

#get cfg
p=$(echo -e "1 Left\n2 Right\n3 Top\n4 Bottom\n5 Mirror" | rofi $opt "Monitor Position" | awk '{print $1}')

#process input 
#separated because of conky clock
#[ top | left | right | bottom ]
case $p in
	"1"|"3") 
		[ "$p" -eq "1" ] && mons -e left
		[ "$p" -eq "3" ] && mons -e top
		#save cfg
		sed -i "s/monitor_position 2/monitor_position 1/" $HOME/.monitor_position
		;;
	"2"|"4")
		[ "$p" -eq "2" ] && mons -e right
		[ "$p" -eq "4" ] && mons -e bottom
		#save cfg
		sed -i "s/monitor_position 1/monitor_position 2/" $HOME/.monitor_position
		;;
	"5")
		#mrror
		mons -m
		sed -i "s/mirror_mode 0/mirror_mode 1/" $HOME/.monitor_position
		;;
	*)
		#exit if anything else
		exit 1 
		;;
esac


