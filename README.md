# Arco-bspwm-config


## 1. Installation

1. install arcolinuxD
2. create ***"git --bare"*** repository:
    - clone dotfiles into a ***"bare"*** repository  
    `$ git clone --bare <git-repo-url> $HOME/.cfg`
    - define the alias in the current ***".bashrc"***  
    `alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME`
    - checkout the actual content from the bare repository to `$HOME` and delete everything that is in conflict  
    `$ config checkout`
    - set the flag ***"showUntrackedFiles"*** to ***"no"*** on this specific (local) repository  
    `$ config config --local status.showUntrackedFiles no`
3. run ***"brisi.py"*** script to delete unnecessary pkg
4. install pkg with ***"yay"***  
`$ yay -S $(<installed_final.txt)`
5. start display manager  
`$ sudo systemctl enable lightdm.service -f`  
`$ sudo systemctl set-default graphical.target`




## 2. Setup dual-monitor

After installation, to configure dual monitor setup, run ***".cfg_monitor_pos.sh"***  by presing `super + F8`.

## 3. Suspend & Oblogout

Fors suspend to work properly after lid is closed, comment everythin in file ***"/etc/systemd/logind.conf"*** .

Created rofi script for interactive logout.
