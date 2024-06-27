wget -qO - https://typora.io/linux/public-key.asc | sudo tee /etc/apt/trusted.gpg.d/typora.asc
sudo add-apt-repository -y 'deb https://typora.io/linux ./'
sudo apt update
sudo apt install -y typora

# Add iA Typora theme
mkdir -p ~/.config/Typora/themes
cp -r ~/.local/share/popfury/themes/typora/nord ~/.config/Typora/themes/
cp ~/.local/share/popfury/themes/typora/nord.css ~/.config/Typora/themes/