# get everything up-to-date
sudo apt-get update
sudo apt-get upgrade
# apt is the package manager for ubuntu and debian
# get in an ubuntu extension to it, i think
# update gets a new connection to the repositories
# upgrade gets all installed packages up to the current version

# install essentials required for further steps -- this will take a while
sudo apt-get install git vim i3 gnome zsh thunderbird
# the install option is pretty self-explanatory


# spotify, for music as you work on the rest
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
# i'm not going to try to explain this one, just run it
sudo apt-get update
sudo apt-get install spotify client


# let's set up vim!
mkdir .vim .vim/bundle
# this m(a)k(es) dir(ectories) that we'll be using for the plugin manager
git clone https://www.github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
# git will duplicate the target repo(sitory) online to the directory Vundle.vim
# now we'll edit the configuration file .vimrc
touch ~/.vimrc
# touch creates a file
echo set nocompatible >> ~/.vimrc
# echo + a location will append the text to the file. it's pretty spiffy
echo filetype off >> ~/.vimrc
echo set rtp+=~/.vim/bundle/Vundle.vim >> ~/.vimrc
echo "call vundle#begin()" >> ~/.vimrc
# don't worry about these, they just run the package manager
# now some plugins
echo Plugin 'gmarik/Vundle.vim' >> ~/.vimrc
# this makes Vundle manage itself. crazy.
echo Plugin 'tpope/vim-sensible' >> ~/.vimrc
# this is the universally agreed thing i told you about
# now we stop the plugin manager
echo "vundle#end()" >> ~/.vimrc
# and we turn on filetype detection (for highlighting)
echo filetype plugin indent on >> ~/.vimrc
# now we turn on syntax highlighting (trust me, it's good)
echo sytax on >> ~/.vimrc
echo sytax enable >> ~/.vimrc
# install plugins
vim -E -c PluginInstall -c wq

# get zsh up and running because it's nice
# change your default shell to zsh
chsh -s $(which zsh)
# ch(ange)sh(ell) -s (for the current user) $(trick to find zsh location on disk)
# now we'll set up antigen, for plugins
git clone https://www.github.com/zsh-users/antigen .antigen
# git will duplicate the target repo(sitory) online to the directory .antigen
# now we'll edit the zsh config file ".zshrc"
echo source .antigen/antigen.zsh >> ~/.zshrc
# this calls the plugin manager
echo antigen use oh-my-zsh >> ~/.zshrc
# this tells it to use a particular repository of plugins
# now some plugins
echo antigen bundle git >> ~/.zshrc
echo antigen bundle command-not-found >> ~/.zshrc
echo antigen bundle sudo >> ~/.zshrc
echo antigen bundle zsh-users/zsh-syntax-highlighting >> ~/.zshrc
# and a theme
echo antigen theme terminalparty >> ~/.zshrc
# and finish the plugin manager
echo antigen apply >> ~/.zshrc

# you may want to open a new terminal window now

# paper theme
sudo add-apt-repository ppa:snwh/pulp
sudo apt-get update
sudo apt-get install paper-icon-theme paper-gtk-theme

# flattr icons
mkdir Builds
# from now on i'll be cloning git repos into Builds to work with them
git clone https://www.github.com/NitruxSA/flattr-icons.git Builds/flattr-icons
# now move the icons to the right place
mv ~/Builds/flattr-icons/Flattr /usr/share/icons/
# m(o)v(e) thing to place

# Numix icons
sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-icon-theme

# now edit a file so that paper icons fall back on flattr and numix
sudo vim -E /usr/share/icons/Paper/index.theme -c %s/Adwaita/Flattr,Numix-Circle/g -c wq
# this is literally magic
# also now set the theme etc with gnome-tweak-tool

# now for i3 stuff
# we'll replace the i3 package with i3-gaps bc pretty
git clone https://www.github.com/Airblader/i3 ~/Builds/i3-gaps
cd ~/Builds/i3-gaps
make
# this should throw errors because you don't have the dependencies
# so we'll fix it
sudo apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev
# that should do it
make
# should work now
# and now install 
sudo make install


# now gnome-i3
sudo add-apt-repository -y ppa:lvillani/i3
sudo apt-get update
sudo apt-get install -y i3-gnome
# now you shold be able to log in to that, but don't yet
# just get my config
mkdir .i3
vim -E -c r https://www.pastebin.com/raw.php?i=k53dT39Q -c wq
# i swear i'm a wizard


# i think things should be usable now
# some tweaks now, i guess

