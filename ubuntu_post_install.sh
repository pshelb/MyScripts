#!/bin/bash

echo "Hello, $USER. Installing applications..."

# Clean up folders
rm ~/examples.desktop
mkdir ~/Development

# Run as sudo from start
sudo -v

# Update
read -p "Updating the list of available updates. Press enter to continue."
sudo apt-get -y update

# Upgrade
read -p "Upgrading current packages.. Press enter to continue."
sudo apt-get -y upgrade

# Open VM Tools
read -p "Install Open VM Tools? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    read -p "Is this a desktop install (not a headless server)? [Y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]];
    then
        echo "Installing Open VM Tools (Desktop)."
        sudo apt-get -y install open-vm-tools-desktop
    else
        echo "Installing Open VM Tools."
        sudo apt-get -y install open-vm-tools
    fi
fi
 
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

# GIMP
read -p "Install GIMP? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing GIMP."
    sudo apt-get -y install gimp
fi

# Inkscape
read -p "Install Inkscape? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing Inkscape."
    sudo apt-get -y install inkscape
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

# Arc Theme
read -p "Install Arc Theme? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing Arc Theme."
    sudo apt-get -y install arc-theme
fi

# Numix Theme
read -p "Install Numix Theme? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing Numix Theme."
    sudo apt-get -y install numix-gtk-theme
fi

# Papirus Icons
read -p "Install Papirus Icons? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing Papirus Icons."
    sudo add-apt-repository ppa:papirus/papirus
    sudo apt update && sudo apt-get -y install papirus-icon-theme
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
    sudo add-apt-repository ppa:git-core/ppa
    sudo apt update
    sudo apt -y install git
fi

# Oracle JDK 8
read -p "Install Oracle JDK 8? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing Oracle JDK 8."
    echo "Part A - Add the PPA."
    sudo add-apt-repository ppa:webupd8team/java
    echo "Part B - Update system package index."
    sudo apt update
    echo "Part C - Install Java installer script."
    sudo apt -y install oracle-java8-installer
    echo "Part D - Set environment variable (Requires a restart)."
    sudo apt -y install oracle-java8-set-default
    echo "Part E - Check version of Java."
    java -version
fi

# Sublime Text 3
read -p "Install Sublime Text 3? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing Sublime Text 3."
    echo "Part A - Install the GPG key."
    sudo wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    echo "Part B - Ensure apt is set up to work with https sources."
    sudo apt-get -y install apt-transport-https
    echo "Part C - Elect the channel to use."
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    echo "Part D - Update apt sources and install Sublime Text."
    sudo apt-get update
    sudo apt-get -y install sublime-text
fi

# Visual Studio Code
# See https://code.visualstudio.com/docs/setup/linux
read -p "Install Visual Studio Code? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing Visual Studio Code."
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt-get update
    sudo apt-get -y install code
fi

echo "Finished installing applications."
