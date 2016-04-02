#!/bin/sh
# depends on GNU Stow

[ -d ~/.config ] || mkdir ~/.config

# let's make sure that UTF-8 is enabled
sed -e '/en_US.UTF-8/s/#//' -i /etc/locale-gen
locale-gen

# setup pacman for testing repos
sed -e '/#[testing]/s/#//'                                                 \
	-e '/[testing]/{n;s/.*/Include = /etc/pacman.d/mirrorlist/}'           \
	-e '/#[community-testing/s/#//'                                        \
	-e '/[community-testing/{n;s/.*/Include = /etc/pacman.d/mirrorlist/}'  \
	-i /etc/pacman.conf
pacman -Syu
pacman -S stow

# install pacaur to handle AUR installations
[ -d ~/.build ] || mkdir ~/.build
PKGS="cower-git pacaur-git"

for PKG in $PKGS; do
	git clone https://aur.archlinux.org/${PKG}.git ~/.build/$PKG
	(
		cd ~/.build/$PKG
		makepkg -sri
	)
done

# install my custom PKGBUILDs
git clone https://github.com/syntactician/pkgbuild   ~/.build/.pkgbuild
(
	cd ~/.build/.pkgbuild
	for PKG in */; do
		stow $PKG
		(
			cd ../$PKG
			makepkg -sri
		)
	done
)

# install my dotfiles
for CONFIG in */; do
	stow $CONFIG
done

pacaur -S \
	dash libreoffice-fresh pandoc texlive-most ttf-liberation \
	virtualbox-guest-utils xorg-server xorg-xinit \
	dunst-git firefox-nightly hsetroot lemonbar-xft-git llpp wmutils-git \
	neovim-git \

# let's get a functional editor
nvim -c "call PlugFetch()" -c "PlugInstall"
# i'll have to exit this manually. blah.

# configure git
git config --global user.email "edward.hernandez@gmx.com"
git config --global user.name "Edward Hernandez"

# get my work
git clone https://github.com/syntactician/coursework.git ~/courses
git clone https://github.com/syntactician/honors.git     ~/honors
