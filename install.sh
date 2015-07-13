#! /bin/bash
sudo apt-add-repository -y ppa:lvillani/i3
sudo apt-add-repository ppa:snwh/pulp
sudo apt-add-repository ppa:numix/ppa
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install git vim i3 zsh vlc gnome-core i3-gnome paper-gtk-theme paper-icon-theme numix-icon-theme libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev dconf-editor gconf-editor gnome-tweak-tool pcmanfm spotify-client ghc cabal-install
cabal update
cabal install shelly
cd ~
mkdir ~/.builds ~/.vim ~/.vim/bundle ~/.zsh ~/.i3 ~/.config/zathura ~/.config/dunst
git clone https://github.com/Airblader/i3 ~/.builds/i3-gaps
git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
git clone https://github.com/Tarrasch/antigen-hs.git ~/.zsh/antigen-hs/
git clone https://github.com/sindresorhus/pure.git ~/.builds/
git clone https://github.com/NitruxSA/flattr-icons ~/.builds/
git clone https://github.com/syntactician/dotfiles.git ~/.dotfiles
git config --global user.email "edward.hernandez@gmx.com"
git config --global user.name "Edward Hernandez"
cd ~/.builds/i3-gaps
make && sudo make install
cd ~
sudo cp ~/.builds/flattr-icons/Flattr /usr/share/icons/
cp ~/.dotfiles/muttrc ~/.muttrc
ln ~/.dotfiles/i3 ~/.i3/config
ln ~/.dotfiles/zshrc ~/.zshrc
ln ~/.dotfiles/vimrc ~/.vimrc
ln ~/.dotfiles/wallpaper.png ~/Pictures/
ln ~/.dotfiles/zathurarc ~/.config/zathura/zathurarc
ln ~/.dotfiles/dunstrc ~/.config/dunst/dunstrc
ln ~/.dotfiles/Xresources ~/.Xresources
ln ~/.dotfiles/README.md ~/todo.md 
ln ~/.dotfiles/MyAntigen.hs ~/.zsh/MyAntigen.hs
sudo ln -s ~/.builds/pure/async.zsh /usr/share/zsh/site-functions/async
sudo ln -s ~/.builds/pure/pure.zsh /usr/share/zsh/site-functions/prompt_pure_setup
cd
chmod +x ~/.dotfiles/ashes.sh
./.dotfiles/ashes.sh
sudo apt-get autoremove
chsh -s $(which zsh)

cd
chmod +x ~/.dotfiles/configurate.zsh
zsh
./configurate.zsh
