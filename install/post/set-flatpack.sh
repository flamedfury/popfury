# flatpak checks for themes/icons in /usr/share/icons
# this overides that to look in ~/.themes and ~/.icons
flatpak --user override --filesystem=/home/$USER/.themes/:ro
flatpak --user override --filesystem=/home/$USER/.icons/:ro

flatpak --user override --env=XCURSOR_PATH=~/.icons

flatpak override --env=GTK_THEME=Nordic-dark
flatpak override --env=ICON_THEME=Nordic-cursors
flatpak override --env=XCURSOR_THEME=Nordic-cursors