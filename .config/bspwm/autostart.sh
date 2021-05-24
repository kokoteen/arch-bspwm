#!/bin/bash

run()
{
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

#create .my_settings if it doesn't exist
[ ! -f "$HOME/.my_settings" ] && printf "%s\n" "mirror_mode 0" > "$HOME/.my_settings"

# rerun autorandr if mirror mode ON
[ "$(grep -w mirror_mode "$HOME/.my_settings" | awk '{print $2}')" -eq "0" ] && autorandr -c

#run conky clock
n=$(xrandr | xrandr -q | sed -nE 's/ connected .* \(.*//p' | wc | awk '{print $1}')
killall conky
for ((i=0;i<n;i++)); do
    conky -c <(sed -e "s/xinerama_head = 0/xinerama_head = ${i}/g" "$HOME/.config/bspwm/clock_primary") &
done

#add keyboard layout
setxkbmap us,rs,hr -option 'grp:ctrl_alt_toggle' 	# man xkeyboard-config

#wallpaper
feh --bg-scale "$HOME/.config/bspwm/wallpapers/pexels-arist-creathrive-2253573.jpg"

xsetroot -cursor_name left_ptr
numlockx on 										# num lock
picom --config "$HOME/.config/bspwm/picom.conf" &

#bluetooth
#blueberry-tray &

run sxhkd 											# keyboard
run "$HOME/.config/polybar/launch.sh"				# polybar
# run autoTogglePolybar
run nm-applet 										# wifi icon
run kdeconnect-indicator							# kdeconnect
run polkit-dumb-agent 								# Authentication agents
run dunst											# notification
run keynav                                          # keyboard mous
