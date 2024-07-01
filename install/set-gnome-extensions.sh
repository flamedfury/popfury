sudo apt install -y gnome-shell-extension-manager pipx
pipx install gnome-extensions-cli --system-site-packages

# # Pause to assure user is ready to accept confirmations
gum confirm "To install Gnome extensions, you need to accept four confirmations. Are you ready?"

gext install audio-output-switcher@anduchs
gext install user-theme@gnome-shell-extensions.gcampax.github.com

# Set default fonts
gsettings set org.gnome.desktop.interface font-name 'Overpass Regular 11'
gsettings set org.gnome.desktop.interface document-font-name 'Overpass Regular 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'Hack Nerd Font Mono 12'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Overpass SemiBold 11'

# Set cursor size
gsettings set org.gnome.desktop.interface cursor-size 36

# Configure tweaks
gsettings set org.gnome.mutter center-new-windows true

# Add week day to clock
gsettings set org.gnome.desktop.interface clock-show-weekday true