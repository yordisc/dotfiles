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
bspcolors &
bspbar &
bspcomp &
bspfloat &

# Lauch xsettingsd daemon
xsettingsd &
#xfsettingsd &
sleep 0.3s

# Polkit agent
/usr/libexec/polkit-gnome-authentication-agent-1 &
sleep 1s

parcellite &
sleep 1s

nitrogen --restore; sleep 1; picom -b &
/usr/libexec/dconf-service &

# Start mpd
exec mpd &

# Enable power management
xfce4-power-manager &

wmname LG3D &

pcloud &
sleep 1s

#nm-applet --indicator &

# Cursor
xsetroot -cursor_name left_ptr &

# Notifications
/usr/bin/dunst &
sleep 0.3s

/usr/bin/picom &
sleep 0.3s


#pavucontrol &
#sleep 0.3

/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
pulseaudio &

#blueman-applet &
#sleep 2

	killall apache2  &
#killall -eq volumeicon &
#sleep 1.5

#flameshot &

# Kill if already running
# killall -9 xsettingsd sxhkd dunst ksuperkey xfce4-power-manager mpd
#systemctl --user restart dbus