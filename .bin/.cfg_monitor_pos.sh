#!/bin/bash

#get cfg
p=$(echo -e "1 Left/Up\n2 Right/Down\n3 Configure monitors position - arandr" | rofi -dmenu -p "Select Monitor Position > " | awk '{print $1}')

#exit if zero
([ -z "$p" ] || ([ "$p" -ne "1" ] && [ "$p" -ne "2" ])) && exit 1

#process input 
if [ "$p" -eq "3" ]; then
	arandr
	p=$(echo -e "1 Left/Up\n2 Right/Down" | rofi -dmenu -p "Select Monitor Position > " | awk '{print $1}')
fi

#save cfg
echo "$p" > .monitor_position
