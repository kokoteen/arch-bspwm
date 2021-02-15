#!/bin/bash

run()
{
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

#create .monitor_position if it doesn't exist
[ ! -f "$HOME/.monitor_position" ] && printf "%s\n" "monitor_position 1" "mirror_mode 0" > "$HOME/.monitor_position"

#find out your monitor name with xrandr or arandr (save and you get this line)
[ "$(grep -w mirror_mode "$HOME/.monitor_position" | awk '{print $2}')" -eq "0" ] && autorandr -c 


# #run conky clock
n=$(xrandr | grep -w connected | wc | awk '{print $1}')
killall conky
for ((i=0;i<n;i++)); do
	conky -c <(sed -e "s/xinerama_head = 0/xinerama_head = ${i}/g" "$HOME/.config/bspwm/clock_primary") &
    sleep 5
done



#add keyboard layout
setxkbmap us,rs,hr -option 'grp:ctrl_alt_toggle' 	# man xkeyboard-config

#wallpaper
feh --bg-scale "$HOME/.config/bspwm/wallpapers/wallhaven-3zovvv.jpg" 

xsetroot -cursor_name left_ptr  
numlockx on 										# num lock 
picom --config "$HOME/.config/bspwm/compton.conf" & 

#bluetooth
#blueberry-tray &

run sxhkd 											# keyboard
run "$HOME/.config/polybar/launch.sh"				# polybar
run autoTogglePolybar
run nm-applet 										# wifi icon
run kdeconnect-indicator							# kdeconnect  
run polkit-dumb-agent 								# Authentication agents
run dunst											# notification
