#!/bin/bash

# To run this script:
# chmod +x vm_install_script.sh
# ./vm_install_script.sh

# TODO
# Install Java and IDE

echo "Hello, $USER. Installing applications..."

# AUTOMATIC INSTALLS

# VMware Tools
# echo "VMware Tools should be automatically installed."

# GIMP
echo "Installing GIMP."
sudo apt-get install gimp

# Git
echo "Installing Git."
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git

# Sublime Text 3
echo "Installing Sublime Text 3."
read -p "Press enter to continue."
echo "Part A - Install the GPG key."
sudo wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "Part B - Ensure apt is set up to work with https sources."
sudo apt-get install apt-transport-https
echo "Part C - Elect the channel to use."
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
echo "Part D - Update apt sources and install Sublime Text."
sudo apt-get update
sudo apt-get install sublime-text

# VS Code
echo "Installing Visual Studio Code."
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install code

# Oracle JDK 8
echo "Installing Oracle JDK."
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
 
# MANUAL INSTALLS

# Google Chrome
echo "Install Google Chrome"
echo "Download .deb from here: https://www.google.com/chrome/browser/desktop/index.html"
echo "sudo dpkg -i google-chrome-stable_current_amd64.deb"
echo "If there are dependency issues, run: sudo apt-get install -f"
echo "and then run the original command again."
read -p "Press enter to continue."
