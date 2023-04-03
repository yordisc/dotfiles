#config de bspwm

sed -i '24s/\(\S\+\s\+\)\(\S\+\s\+\)\(\S\+\s\+\)/\1\2$(ls -1 \/sys\/class\/power_supply\/) /' $HOME/.config/bspwm/polybar/system

sed -i '25s/\(\S\+\s\+\)\(\S\+\s\+\)\(\S\+\s\+\)/\1\2$(ls -1 \/sys\/class\/backlight\/) /' $HOME/.config/bspwm/polybar/system

sed -i '26s/\(\S\+\s\+\)\(\S\+\s\+\)\(\S\+\s\+\)/\1\2$(ip link | awk '\''\/state UP\/ {print $2}'\'' | tr -d :) /' $HOME/.config/bspwm/polybar/system

