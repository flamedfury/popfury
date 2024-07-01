flatpak --user override --filesystem=/home/$USER/.themes/:ro
flatpak --user override --filesystem=/home/$USER/.icons/:ro

flatpak override --env=GTK_THEME=Nordic-dark
flatpak override --env=ICON_THEME=Nordic-cursors
flatpak override --env=XCURSOR_THEME=Nordic-cursors