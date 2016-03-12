#!/bin/sh
# this is specific to arch linux and assummes it is in the same directory as
# the configs i'm shipping
mkdir ~/.config ~/.config/dunst ~/.config/mutt ~/.config/nvim
ln dunstrc  ~/.config/dunst/dunstrc
ln init.vim ~/.config/nvim/init.vim
ln sxhkdrc  ~/.sxhkdrc
ln xinitrc  ~/.xinitrc
ln zshrc    ~/.zshrc
cp muttrc   ~/.config/mutt/muttrc

# let's get some fucking locales before we try to use anything
sed -e '/en_US.UTF-8/s/#//' -i /etc/locale-gen
locale-gen

# an Arch-specific install script for the stuff I feel like I need
pacman -S git

git config --global user.email "edward.hernandez@gmx.com"
git config --global user.name "Edward Hernandez"

# git clone https://github.com/syntactician/dotfiles.git   ~/.dotfiles
git clone https://github.com/syntactician/pkgbuild.git   ~/.pkgbuild

git clone https://github.com/syntactician/coursework.git ~/courses
git clone https://github.com/syntactician/honors.git     ~/honors

# install pacaur to handle AUR installations
mkdir ~/.build
git clone https://aur.archlinux.org/cower-git.git  ~/.build/cower-git  && cd ~/.build/cower-git  && makepkg -sri
git clone https://aur.archlinux.org/pacaur-git.git ~/.build/pacaur-git && cd ~/.build/pacaur-git && makepkg -sri

# install all my PKGBUILDs programmatically
for PKGBUILD in ~/.pkgbuild/*-git; do
	mkdir ~/.build/$(basename $PKGBUILD)
	ln $PKGBUILD ~/.build/$(basename $PKGBUILD)/PKGBUILD
	(
		cd ~/.build/$(basename $PKGBUILD)/
		makepkg -sri
	)
done

# enable testing repos
sed -e '/#[testing]/s/#//'                                                 \
	-e '/[testing]/{n;s/.*/Include = /etc/pacman.d/mirrorlist/}'           \
	-e '/#[community-testing/s/#//'                                        \
	-e '/[community-testing/{n;s/.*/Include = /etc/pacman.d/mirrorlist/}'  \
	-i /etc/pacman.conf

pacaur -S \
	dash libreoffice-fresh pandoc ruby texlive-most ttf-liberation \
	virtualbox-guest-utils xorg-server xorg-xinit \
	dunst-git firefox-nightly hsetroot lemonbar-xft-git llpp wmutils-git \
	neovim-git \

# let's get a functional editor
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln ~/.dotfiles/init.vim ~/.config/nvim/init.vim
# i'll have to exit this manually. blah.
nvim -c "PlugInstall"

gem install gist
gist --login
