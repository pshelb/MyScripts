#!/bin/bash

echo "Hello, $USER. Installing applications..."

# Run as sudo from start
sudo -v

# Update
read -p "Updating the list of available updates. Press enter to continue."
sudo apt-get -y update

# Upgrade
read -p "Upgrading current packages.. Press enter to continue."
sudo apt-get -y upgrade
 
# Google Chrome
read -p "Install Google Chrome? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing Google Chrome."
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    if sudo dpkg -i google-chrome*.deb; then
        echo 'Google Chrome installed.'
    else
        sudo apt-get -y install -f
        sudo dpkg -i google-chrome*.deb
        echo 'Google Chrome installed.'
    fi
    # Clean up
    rm -rf google-chrome*.deb
fi

# Chromium
read -p "Install Chromium? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing Chromium."
    sudo snap install chromium
fi

# GIMP
read -p "Install GIMP? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing GIMP."
    sudo snap install gimp
fi

# Inkscape
read -p "Install Inkscape? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing Inkscape."
    sudo snap install inkscape
fi

# VLC
read -p "Install VLC? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing VLC."
    sudo apt-get -y install vlc
fi

# GParted
read -p "Install GParted? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing GParted."
    sudo apt-get -y install gparted
fi

# Ubuntu Restricted Extras
read -p "Install Ubuntu Restricted Extras? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing Ubuntu Restricted Extras."
    sudo apt-get -y install ubuntu-restricted-extras
    sudo apt-get remove gstreamer1.0-fluendo-mp3
fi

# GNOME Tweak Tool
read -p "Install GNOME Tweak Tool? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing GNOME Tweak Tool."
    sudo apt-get -y install gnome-tweak-tool
fi

# GNOME Shell Extensions
read -p "Install Shell Extensions? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing GNOME Shell Extensions."
    sudo apt-get -y install gnome-shell-extensions
fi

# htop
read -p "Install htop? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing htop."
    sudo apt-get -y install htop
fi

# screenfetch
read -p "Install screenfetch? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing screenfetch."
    sudo apt-get -y install screenfetch
fi

# Meld
read -p "Install Meld? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing Meld."
    sudo apt-get -y install meld
fi

# Git
read -p "Install Git? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing Git."
    sudo apt -y install git
fi

# Visual Studio Code
read -p "Install Visual Studio Code? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing Visual Studio Code."
    sudo snap install code --classic
fi

echo "Finished installing applications."
