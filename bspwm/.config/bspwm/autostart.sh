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


# Start bspwm scripts
bspcolors
bspbar
bspcomp
bspfloat &

# Lauch xsettingsd daemon
xsettingsd &

# Polkit agent
if [[ ! `pidof xfce-polkit` ]]; then
	/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
fi

#parcellite &
xfce4-clipman &
sleep 1

nitrogen --restore; sleep 1; picom -b &

# Start mpd
exec mpd &

# Enable power management
xfce4-power-manager &

wmname LG3D &

pcloud &
sleep 1

#nm-applet --indicator &

# Cursor
xsetroot -cursor_name left_ptr &

# Notifications
/usr/bin/dunst &
#nm-tray &
#sleep 0.3

/usr/bin/picom &
#sleep 0.3

#pavucontrol &
#sleep 0.3

#blueman-applet &
#sleep 2

#pulseaudio &
#sleep 1

#killall -eq volumeicon &
#sleep 1.5

#flameshot &

# Kill if already running
# killall -9 xsettingsd sxhkd dunst ksuperkey xfce4-power-manager mpd


