sudo apt update
sudo apt install -y vlc libavcodec-extra libdvd-pkg
echo 'libdvd-pkg libdvd-pkg/first-install note' | sudo debconf-set-selections
echo 'libdvd-pkg libdvd-pkg/post-invoke_hook-active boolean true' | sudo debconf-set-selections
sudo DEBIAN_FRONTEND=noninteractive dpkg-reconfigure libdvd-pkg

# Set VLC as the default
xdg-mime default vlc.desktop video/x-msvideo
xdg-mime default vlc.desktop video/mp4
xdg-mime default vlc.desktop video/mpeg