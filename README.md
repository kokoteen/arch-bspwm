# Arch-bspwm


## 1. Installation

1. install [arch](https://wiki.archlinux.org/index.php/installation_guide "arch")  
    `base base-devel linux linux-firmware dhcpcd 
     intel-ucode vim man-db man-pages inetutils netctl iwd`
2. install yay:  
	- get yay from git
	`git clone https://aur.archlinux.org/yay.git`
	- make pkg
	`cd yay && makepkg -si`
3. create ***"git --bare"*** repository:
    - clone dotfiles into a ***"bare"*** repository  
    `$ git clone --bare https://github.com/kokoteen/arch-bspwm.git $HOME/.cfg`
    - define the alias in the current ***".bashrc"***  
    `alias gitt='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`
    - checkout the actual content from the bare repository to `$HOME` and delete everything that is in conflict  
    `$ gitt checkout`
    - set the flag ***"showUntrackedFiles"*** to ***"no"*** on this specific (local) repository  
    `$ gitt config --local status.showUntrackedFiles no`
4. install pkg with ***"yay"***  
    `$ yay -S $(<pkgs.txt)`
5. if you're not using display manager, add in `bash_profile` following code if you want to autostart `startx`:   
    ```console
    if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
        exec startx 2> "$HOME"/.xsession-errors
    fi
    ```
6. if you're using display manager, start it with following commands:  
`$ sudo systemctl enable lightdm.service -f`  
`$ sudo systemctl set-default graphical.target`



## 2. Setup dual-monitor

After installation, to configure dual monitor setup, run ***"cfg_monitor_pos.sh"***  by presing `super + F10`.

## 3. Common problems

### 1. Suspend
For suspend to work properly after lid is closed, comment everythin in file ***"/etc/systemd/logind.conf"*** .

### 2. VScode opens files instead of file manager
Common problem with default file manager is when vscode starts opening files. To address this problem, in file `/usr/share/applications/code.desktop` change the row `MimeType=text/plain;inode/directory;` to `MimeType=text/plain;`  
Then run `xdg-mime default exo-file-manager.desktop`

### 3. Autologin & colored output of `yay`  
To autologin into the system run `systemctl edit getty@tty1` and paste the following content:  
```
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin username --noclear %I $TERM
Type=simple
```
For `yay` to have colored output uncomment `Color` in `/etc/pacman.conf`

### 4. Powerline fonts
Detailed instruction can be found [here](https://github.com/powerline/fonts.git)

### 5. Move /home to partition
Instruction can be found [here](https://help.ubuntu.com/community/Partitioning/Home/Moving)