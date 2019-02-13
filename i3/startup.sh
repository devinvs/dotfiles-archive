#!/bin/sh
urxvt --depth=32 -e neofetch
sleep .0001
urxvt --depth=32 -e tty-clock -c -C4 -t
sleep .0001
urxvt --depth=32 -e /usr/local/bin/cava -p ~/.i3/config.cava
