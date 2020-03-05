#!/bin/bash

#get cfg
p=$(echo -e "Left/Up: 1\nRight/Down: 2\nMirror: 3" | rofi -dmenu -p "Select Monitor Position > ")

#ptocess input and save cfg
echo "$p" | awk '{print $2}' > .monitor_position

