# arco-bspwm-config


#### Installation

1. install arcolinuxD
2. create *git --bare* repository:
    1. clone dotfiles into a *bare* repository
    `<$ git clone --bare <git-repo-url> $HOME/.cfg>`
    2. define the alias in the current *.bashrc*
    `<alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME>`
    3. checkout the actual content from the bare repository to $HOME and delete everything that is in conflict
    `<config checkout>`
    4. set the flag *showUntrackedFiles* to *no* on this specific (local) repository
    `<config config --local status.showUntrackedFiles no>`



#### Setup dual-monitor

1. arandr to graphically configure monitor setup
2. autorandr to save all mods
3. edit comptin files for correct time

