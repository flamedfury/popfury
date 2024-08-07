# Installs Firefox Developer Edition.
cd ~/Downloads
sudo apt remove --purge -y firefox
wget -O firefox-developer.tar.bz2 "https://download.mozilla.org/?product=firefox-devedition-latest&os=linux64" --trust-server-names
tar -xf firefox-developer.tar.bz2
rm -rf firefox-developer.tar.bz2
mv firefox firefox-developer
sudo mv firefox-developer /opt
sudo ln -s /opt/firefox-developer/firefox /usr/bin/firefox-developer
# DESKTOP INTEGRATION
echo -e "[Desktop Entry]\nEncoding=UTF-8\nName=Firefox Developer Edition\nComment=Firefox Developer Edition\nExec=/opt/firefox-developer/firefox %u\nTerminal=false\nIcon=/opt/firefox-developer/browser/chrome/icons/default/default128.png\nStartupWMClass=firefox-aurora\nType=Application\nCategories=Network;WebBrowser;\nMimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;x-scheme-handler/http;x-scheme-handler/https;\nStartupNotify=true\n" | tee -a ~/.local/share/applications/firefox-developer.desktop
cd -