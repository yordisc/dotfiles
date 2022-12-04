#!/usr/bin/env bash
###############################################################
#                                                             #
#                                  __ _                       #
#              _ __ ___ _ __ ___  / _| |_   _                 #
#             | '__/ _ \ '_ ` _ \| |_| | | | |                #
#             | | |  __/ | | | | |  _| | |_| |                #
#             |_|  \___|_| |_| |_|_| |_|\__, |                #
#                                       |___/                 #
#                                                             #
#                                                             #
###############################################################
#                                                             #
#           https://github.com/remfly/dotfiles                #
#                                                             #
###############################################################


external_monitor="$(xrandr --query | grep -v 'disconnected' | grep 'HDMI-1')"

if [[ "${external_monitor}" = *connected* ]]; then
    xrandr --output LVDS-1 --off --output HDMI-1 --primary --mode 1280x800 --pos 0x0 --rotate normal &
    bspc monitor HDMI-1 -d -d 1 2 3 4 5 6 7 8
    /home/admin/.config/polybar/monitor.sh &
    /usr/bin/dunst -config /home/admin/.config/dunst/monitor_dunstrc &
    xgamma -rgamma 1,1 -ggamma 1,1 -bgamma 1,1 &
    exec setxkbmap -layout us -variant altgr-intl &

else
    xrandr --output LVDS-1 --primary --mode 1280x800 --pos 0x0 --rotate normal --output HDMI-1 --off &
    bspc monitor LVDS-1 -d -d 1 2 3 4 5 6 7 8
    /home/admin/.config/polybar/laptop.sh &
    /usr/bin/dunst -config /home/admin/.config/dunst/laptop_dunstrc &
    xgamma -rgamma 0.8,0.8 -ggamma 0.8,0.8 -bgamma 0.75,0.75 &
    exec setxkbmap -layout br &
fi
