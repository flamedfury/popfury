cd ~/Downloads
wget -O codium.deb 'https://github.com/VSCodium/vscodium/releases/download/1.90.0.24158/codium_1.90.0.24158_amd64.deb'
sudo apt install -y ./codium.deb
rm codium.deb
cd -

mkdir -p ~/.config/VSCodium/User
cp ~/.local/share/popfury/configs/codium.json ~/.config/VSCodium/User/settings.json

# Install default supported themes
codium --install-extension arcticicestudio.nord-visual-studio-code