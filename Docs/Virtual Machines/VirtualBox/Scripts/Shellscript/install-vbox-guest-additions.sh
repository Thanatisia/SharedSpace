: "
Install VirtualBox Guest Additions
"
### Variables ###
user=$USER
VBox_GA_VERS="6.1.32"

# Update and Upgrade Repository to latest version
sudo apt update && sudo apt upgrade

# Install Dependencies
sudo apt install gcc make perl

# Run VBox Guest Additions Installer
cd /media/$user/VBox_GAs_$VBox_GA_VERS
sudo ./VBoxLinuxAdditions.run

# Add current user to group 'vboxsf' to have permission to traverse shared folder
sudo usermod -a -G vboxsf $user

