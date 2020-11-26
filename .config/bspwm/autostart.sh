#!/bin/sh

run()
{
  if ! pgrep "$1" ;
  then
    "$@"&
  fi
}

#create .monitor_position if it doesn't exist
[ ! -f "$HOME/.monitor_position" ] && printf "%s\n" "monitor_position 1" "mirror_mode 0" > "$HOME/.monitor_position"

#find out your monitor name with xrandr or arandr (save and you get this line)
autorandr -c --force

#create/configures .clock_docked 
#for conky clock
if [ "$(xrandr | grep -w connected | wc | awk '{print $1}')" -eq "2" ]; then
	#if FILE doesn't exist
	FILE="$HOME/.clock_docked"
	if [ ! -f "$FILE" ]; then
		#copy & rename cloc_primary for docked monitor
		cp "$HOME/.config/bspwm/clock_primary" "$HOME/"
		mv "$HOME/clock_primary" "$FILE"
		#edit file
		sed -i "s/alignment = 'top_middle'/alignment = 'top_right'/" "$FILE"
		sed -i "s/own_window_title = 'concky_clock_primary'/own_window_title = 'concky_clock_docked'/" "$FILE"
	fi

	#check if the position and clock differ
	if [ "$(grep -w xinerama_head "$FILE" | awk -F'[, ]' '{print $3}')" -ne "$(grep -w monitor_position "$HOME/.monitor_position" | awk '{print $2}')" ]; then
  		#left position
		[ "$(grep -w monitor_position "$HOME/.monitor_position" | awk '{print $2}')" -eq "1" ] && sed -i "s/xinerama_head = 0/xinerama_head = 1/" "$FILE"
		# right position
		[ "$(grep -w monitor_position "$HOME/.monitor_position" | awk '{print $2}')" -eq "2" ] && sed -i "s/xinerama_head = 0/xinerama_head = 2/" "$FILE"
	fi
fi

#run conky clock
if [ "$(xrandr | grep -w connected | wc | awk '{print $1}')" -eq  "2" ]; then
	if [ "$(grep -w mirror_mode "$HOME/.monitor_position" | awk '{print $2}')" -eq "0" ]; then
		killall conky
		conky -c "$HOME/.config/bspwm/clock_primary" &
		conky -c "$HOME/.clock_docked" &
	elif [ "$(grep -w mirror_mode "$HOME/.monitor_position" | awk '{print $2}')" -eq "1" ]; then
		killall conky
		conky -c "$HOME/.config/bspwm/clock_primary" &
	fi
elif [ "$(xrandr | grep -w connected | wc | awk '{print $1}')" -eq "1" ]; then
	killall conky
	conky -c "$HOME/.config/bspwm/clock_primary" &
fi


#add keyboard layout
setxkbmap us,rs,hr -option 'grp:ctrl_alt_toggle' 	# man xkeyboard-config

#wallpaper
feh --bg-scale "$HOME/.config/bspwm/wallpapers/portal.jpg" 

xsetroot -cursor_name left_ptr  
numlockx on 										# num lock 
picom --config "$HOME/.config/bspwm/compton.conf" & 

#bluetooth
#blueberry-tray &

run sxhkd 											# keyboard
run "$HOME/.config/polybar/launch.sh"				# polybar
run nm-applet 										# wifi icon
run kdeconnect-indicator							# kdeconnect  
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 	# Authentication agents
run dunst											# notification
