#!/usr/bin/bash

yay -Sl | \
awk '{print $2($4=="" ? "" : " *")}'| \
fzf -i -m --preview "cat <(yay -Sii {1})" --layout=reverse | \
xargs -ro -n1 yay -Sy
