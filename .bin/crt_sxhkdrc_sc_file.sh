#!/usr/bin/bash

input="$HOME/.config/sxhkd/sxhkdrc"
output="$HOME/.config/sxhkd/sxhkdrc_sc_file"

[[ -f "$output" ]] && rm $output

while read -r line; do
    if [[ "$line" =~ "## " ]]; then
        read line1

        line=${line//"## "/}
        num=$(expr 62 - ${#line})
        stars=$(printf "%-${num}s")
        echo "${line}""${stars// /" "}""| $line1" >>"$output"

    fi
done <"$input"
