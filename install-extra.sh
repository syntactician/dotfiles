#! /bin/bash
sudo apt-add-repository -y ppa:snwh/pulp
sudo apt-add-repository -y ppa:numix/ppa
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y numix-icon-theme paper-icon-theme paper-gtk-theme spotify-client
