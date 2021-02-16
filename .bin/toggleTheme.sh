#!/bin/sh

DARK_MODE=$(grep -w dark_mode "$HOME/.my_settings" | awk '{print $2}')

if [ "$DARK_MODE" -eq "0" ]; then
    #Dark
    sed -i "s+dark_mode 0+dark_mode 1+" "$HOME/.my_settings"

    #gtk3
    sed -i "s+gtk-icon-theme-name=Papirus+gtk-icon-theme-name=Papirus-Dark+" "$HOME/.config/gtk-3.0/settings.ini"
    sed -i "s+gtk-theme-name=Adwaita+gtk-theme-name=Arc-Dark+" "$HOME/.config/gtk-3.0/settings.ini"

    #gtk2
    sed -i "s+gtk-icon-theme-name=\"Papirus\"+gtk-icon-theme-name=\"Papirus-Dark\"+" "$HOME/.gtkrc-2.0"
    sed -i "s+gtk-theme-name=\"Adwaita\"+gtk-theme-name=\"Arc-Dark\"+" "$HOME/.gtkrc-2.0"

    #alacritty
    sed -i "s+colors: \*light+colors: \*dark+" "$HOME/.config/alacritty/alacritty.yml"

    #vim
    sed -i "s+set background=light+set background=dark+" "$HOME/.vimrc"
    sed -i "s+colorscheme PaperColor+colorscheme dracula+" "$HOME/.vimrc"

    #qt5ct
    sed -i "s+icon_theme=Papirus+icon_theme=Papirus-Dark+" "$HOME/.config/qt5ct/qt5ct.conf"
    sed -i "s+color_scheme_path=/usr/share/qt5ct/colors/airy.conf+color_scheme_path=/usr/share/qt5ct/colors/darker.conf+" "$HOME/.config/qt5ct/qt5ct.conf"
    sed -i "s+custom_palette=false+custom_palette=true+" "$HOME/.config/qt5ct/qt5ct.conf"
else
    #Light
    sed -i "s+dark_mode 1+dark_mode 0+" "$HOME/.my_settings"

    #gtk3
    sed -i "s+gtk-icon-theme-name=Papirus-Dark+gtk-icon-theme-name=Papirus+" "$HOME/.config/gtk-3.0/settings.ini"
    sed -i "s+gtk-theme-name=Arc-Dark+gtk-theme-name=Adwaita+" "$HOME/.config/gtk-3.0/settings.ini"

    #gtk2
    sed -i "s+gtk-icon-theme-name=\"Papirus-Dark\"+gtk-icon-theme-name=\"Papirus\"+" "$HOME/.gtkrc-2.0"
    sed -i "s+gtk-theme-name=\"Arc-Dark\"+gtk-theme-name=\"Adwaita\"+" "$HOME/.gtkrc-2.0"

    #alacritty
    sed -i "s+colors: \*dark+colors: \*light+" "$HOME/.config/alacritty/alacritty.yml"

    #vim
    sed -i "s+set background=dark+set background=light+" "$HOME/.vimrc"
    sed -i "s+colorscheme dracula+colorscheme PaperColor+" "$HOME/.vimrc"

    #qt5ct
    sed -i "s+icon_theme=Papirus-Dark+icon_theme=Papirus+" "$HOME/.config/qt5ct/qt5ct.conf"
    sed -i "s+color_scheme_path=/usr/share/qt5ct/colors/darker.conf+color_scheme_path=/usr/share/qt5ct/colors/airy.conf+" "$HOME/.config/qt5ct/qt5ct.conf"
    sed -i "s+custom_palette=true+custom_palette=false+" "$HOME/.config/qt5ct/qt5ct.conf"
fi

killall nm-applet 







