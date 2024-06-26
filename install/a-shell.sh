[ -f "~/.bashrc" ] && mv ~/.bashrc ~/.bashrc.bak
cp ~/.local/share/popfury/configs/bashrc ~/.bashrc
source ~/.local/share/popfury/defaults/bash/shell

[ -f "~/.inputrc" ] && mv ~/.inputrc ~/.inputrc.bak
cp ~/.local/share/popfury/configs/inputrc ~/.inputrc
