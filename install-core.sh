#! /bin/bash
# this assumes that this repo is cloned to ~/.dotfiles and is only tested on Ubuntu 14.04 - 15.10
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install -y vim i3 zsh vlc paper-gtk-theme paper-icon-theme numix-icon-theme libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev dconf-editor gconf-editor gnome-tweak-tool pcmanfm spotify-client ghc cabal-install
cabal update
cabal install shelly
cd ~
mkdir ~/.builds ~/.vim ~/.vim/bundle ~/.zsh ~/.i3 ~/.config/zathura ~/.config/dunst ~/.config/xfce4 ~/.config/xfce4/xfconf ~/.config/xfce4/xconf/xfce-perchannel-xml
git clone https://github.com/Airblader/i3 ~/.builds/i3-gaps
git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
git clone https://github.com/Tarrasch/antigen-hs.git ~/.zsh/antigen-hs/
git clone https://github.com/sindresorhus/pure.git ~/.builds/pure
git clone https://github.com/NitruxSA/flattr-icons ~/.builds/flattr-icons
git clone https://github.com/syntactician/dotfiles.git ~/.dotfiles
git config --global user.email "edward.hernandez@gmx.com"
git config --global user.name "Edward Hernandez"
cd ~/.builds/i3-gaps
make && sudo make install
cd ~
sudo cp ~/.builds/flattr-icons/Flattr /usr/share/icons/
cp ~/.dotfiles/muttrc ~/.muttrc
ln -f ~/.dotfiles/xfce/* ~.config/xfce4/xconf/xfce-perchannel-xml/
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
./.dotfiles/ashes.sh
sudo apt-get autoremove
chsh -s $(which zsh)
cd
zsh configure.zsh
zsh
