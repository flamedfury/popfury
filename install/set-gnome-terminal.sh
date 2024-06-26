# Load terminal theme (nord)
cp ~/.local/share/popfury/configs/gnome-terminal-profiles.dconf ~/Downloads/
cd ~/Downloads
dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal-profiles.dconf
rm -f gnome-terminal-profiles.dconf