# arco-bspwm-config


#### Installation

1. install arcolinuxD
2. create ***git --bare*** repository:
    - clone dotfiles into a ***bare*** repository  
    `<$ git clone --bare <git-repo-url> $HOME/.cfg>`
    - define the alias in the current ***.bashrc***  
    `<alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME>`
    - checkout the actual content from the bare repository to `<$HOME>` and delete everything that is in conflict  
    `<$ config checkout>`
    - set the flag ***showUntrackedFiles*** to ***no*** on this specific (local) repository  
    `<$ config config --local status.showUntrackedFiles no>`
3. run ***brisi.py*** script to delete unnecessary pkg
4. install pkg with ***yay***  
`<$ yay -S $(<installed_final.txtr)>`
5. start display manager
`<$ sudo systemctl enable lightdm.service -f>`
`<$ sudo systemctl set-default graphical.target>`




#### Setup dual-monitor

1. arandr to graphically configure monitor setup
2. autorandr to save all mods
3. edit comptin files for correct time

