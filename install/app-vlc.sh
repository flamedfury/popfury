sudo apt install -y vlc
sudo apt install -y libavcodec-extra libdvd-pkg
sudo dpkg-reconfigure libdvd-pkg

# Set VLC as the default
xdg-mime default vlc.desktop video/x-msvideo
xdg-mime default vlc.desktop video/mp4
xdg-mime default vlc.desktop video/mpeg