#!/bin/bash

#get cfg
p=$(echo -e "1 Left/Up\n2 Right/Down\n3 Mirror\n4 Configure monitors position - arandr" | rofi -dmenu -p "Select Monitor Position > ")

#process input 
if [ "$(echo "$p" | awk '{print $1}')" -eq 4 ]; then
	arandr
	p=$(echo -e "1 Left/Up\n2 Right/Down\n3 Mirror\n4 Configure monitors position - arandr" | rofi -dmenu -p "Select Monitor Position > ")
fi

#save cfg
echo "$p" | awk '{print $1}' > .monitor_position
