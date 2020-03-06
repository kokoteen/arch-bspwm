#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#find out your monitor name with xrandr or arandr (save and you get this line)
autorandr -c --force

#create/configures .clock_docked 
#for conky clock
if [ $(xrandr | grep -w connected | wc | awk '{print $1}') == "2" ]; then
	#if FILE doesn't exist
	FILE=$HOME/.clock_docked
	if [ ! -f "$FILE" ]; then
		#copy & rename cloc_primary for docked monitor
		cp $HOME/.config/bspwm/clock_primary $HOME/
		mv $HOME/clock_primary $HOME/.clock_docked
		#edit file
		sed -i "s/alignment = 'top_middle'/alignment = 'top_right'/" $HOME/.clock_docked
		sed -i "s/own_window_title = 'concky_clock_primary'/own_window_title = 'concky_clock_docked'/" $HOME/.clock_docked
	fi

	#check if the position and clock differ
	if [ $(cat .clock_docked | grep -w xinerama_head | awk -F'[, ]' '{print $3}') != $(cat $HOME/.monitor_position) ]; then
		#show clock based on a value in .monitor_position
		if [ $(cat $HOME/.monitor_position) == "1" ]; then
			#left position
			sed -i "s/xinerama_head = 0/xinerama_head = 1/" $HOME/.clock_docked
		elif [ $(cat $HOME/.monitor_position) == "2" ]; then
			#right position
			sed -i "s/xinerama_head = 0/xinerama_head = 2/" $HOME/.clock_docked
    fi
	fi
fi

#run conky clock
if [ $(xrandr | grep -w connected | wc | awk '{print $1}') == "2" ]; then
	killall conky
	conky -c $HOME/.config/bspwm/clock_primary &
	conky -c $HOME/.clock_docked &
elif [ $(xrandr | grep -w connected | wc | awk '{print $1}') == "1" ]; then
	killall conky
	conky -c $HOME/.config/bspwm/clock_primary &
fi

#polybar
$HOME/.config/polybar/launch.sh &

#add keyboard layout
setxkbmap us,rs,hr -option 'grp:ctrl_alt_toggle' #man xkeyboard-config

#wallpaper
feh --bg-scale $HOME/.config/bspwm/submerged_4k_desktop.jpg &

xsetroot -cursor_name left_ptr &
sxhkd &

#bluetooth
#blueberry-tray &

run nm-applet &
run pamac-tray &
run xfce4-power-manager &
numlockx on &
compton --config $HOME/.config/bspwm/compton.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
run kdeconnect-indicator &
