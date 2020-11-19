#!/usr/bin/bash

yay -Slq | fzf -m --preview 'yay -Si {1}' | xargs -r yay -S