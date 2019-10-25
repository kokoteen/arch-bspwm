#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#Find out your monitor name with xrandr or arandr (save and you get this line)
autorandr -c --force

#polybar
$HOME/.config/polybar/launch.sh &

#add keyboard layout
setxkbmap us,rs,hr -option 'grp:ctrl_alt_toggle' #man xkeyboard-config

#Some ways to set your wallpaper besides variety or nitrogen
feh --bg-scale ~/.config/bspwm/submerged_4k_desktop.jpg &
#feh --randomize --bg-fill ~/Képek/*
#feh --randomize --bg-fill ~/Dropbox/Apps/Desktoppr/*

xsetroot -cursor_name left_ptr &
sxhkd &

#conky time
if [[ $(xrandr | grep "*" | wc | awk '{print $1}') == "2" ]]; then
		killall conky
		conky -c $HOME/.config/bspwm/clock_primary &
		conky -c $HOME/.config/bspwm/clock_docked &
elif [[ $(xrandr | grep "*" | wc | awk '{print $1}') == "1" ]]; then
		killall conky
        conky -c $HOME/.config/bspwm/clock_primary &
fi

run variety &
run nm-applet &
run pamac-tray &
run xfce4-power-manager &
numlockx on &
blueberry-tray &
compton --config $HOME/.config/bspwm/compton.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
#run thunar &
