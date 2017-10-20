#!/bin/bash

echo "Hello, $USER. Installing applications..."

# Clean up folders
rm ~/examples.desktop
mkdir ~/Development

# Run as sudo from start
sudo -v

# Update
read -p "Updating the list of available updates. Press enter to continue."
sudo apt-get update

# Upgrade
read -p "Upgrading current packages.. Press enter to continue."
sudo apt-get upgrade

# GIMP
read -p "Install GIMP? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing GIMP."
    sudo apt-get install gimp
fi
 
# Google Chrome
read -p "Install Google Chrome? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing Google Chrome."
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    if sudo dpkg -i google-chrome*.deb; then
        echo 'Google Chrome installed.'
    else
        sudo apt-get install -f
        sudo dpkg -i google-chrome*.deb
        echo 'Google Chrome installed.'
    fi
    # Clean up
    rm -rf google-chrome*.deb
fi

# GNOME Tweak Tool
read -p "Install GNOME Tweak Tool? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing GNOME Tweak Tool."
    sudo apt-get install gnome-tweak-tool
fi

# GParted
read -p "Install GParted? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing GParted."
    sudo apt-get install gparted
fi

# Meld
read -p "Install Meld? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing Meld."
    sudo apt-get install meld
fi

# VLC
read -p "Install VLC? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing VLC."
    sudo apt-get install vlc
fi

# Ubuntu Restricted Extras
read -p "Install Ubuntu Restricted Extras? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing Ubuntu Restricted Extras."
    sudo apt-get install ubuntu-restricted-extras
fi

# Git
read -p "Install Git? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing Git."
    sudo add-apt-repository ppa:git-core/ppa
    sudo apt update
    sudo apt install git
fi

# Oracle JDK 8
read -p "Install Oracle JDK 8? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing Oracle JDK 8."
    echo "Part A - Add the PPA."
    sudo add-apt-repository ppa:webupd8team/java
    echo "Part B - Update system package index."
    sudo apt update
    echo "Part C - Install Java installer script."
    sudo apt install oracle-java8-installer
    echo "Part D - Set environment variable (Requires a restart)."
    sudo apt install oracle-java8-set-default
    echo "Part E - Check version of Java."
    java -version
fi

# Sublime Text 3
read -p "Install Sublime Text 3? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing Sublime Text 3."
    echo "Part A - Install the GPG key."
    sudo wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    echo "Part B - Ensure apt is set up to work with https sources."
    sudo apt-get install apt-transport-https
    echo "Part C - Elect the channel to use."
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    echo "Part D - Update apt sources and install Sublime Text."
    sudo apt-get update
    sudo apt-get install sublime-text
fi

# Visual Studio Code
read -p "Install Visual Studio Code? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
    echo "Installing Visual Studio Code."
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt-get update
    sudo apt-get install code
fi

echo "Finished installing applications."
