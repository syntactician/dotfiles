sudo apt-add-repository -y ppa:lvillani/i3
sudo apt-add-repository ppa:snwh/pulp
sudo apt-add-repository ppa:numix/ppa
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install git vim i3 zsh vlc gnome-core i3-gnome paper-gtk-theme paper-icon-theme numix-icon-theme libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev
mkdir ~/Builds
cd ~/Builds
git clone https://github.com/Airblader/i3 i3-gaps
cd ~/Builds/i3-gaps
make && sudo make install
cd
mkdir .vim .vim/bundle
git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
git clone https://github.com/syntactician/dotfiles.git .dotfiles
