mkdir -p ~/.local/share/fonts

cd ~/Downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip
unzip Hack.zip -d Hack
cp Hack/*.ttf ~/.local/share/fonts
rm -rf Hack.zip Hack

wget -O overpass.zip https://github.com/RedHatOfficial/Overpass/releases/download/v3.0.5/overpass-3.0.5.zip
unzip overpass.zip -d overpass
cp overpass/Overpass-3.0.5/desktop-fonts/overpass/overpass-*.otf ~/.local/share/fonts
rm -rf overpass.zip overpass

fc-cache
cd -