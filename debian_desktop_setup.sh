#!/usr/bin/bash

#### INFOS
## Applications folder: /usr/share/applications
##
## Add Teamspeak to Application folder:
##   sudo cp ./teamspeak-client.desktop /usr/share/applications/teamspeak-client.desktop
##
####



# System Update
sudo apt update && sudo apt upgrade -y

# Stuff for installing 3rd party packages
sudo apt-get install -y wget gpg apt-transport-https git

# Allow 32 bit programms
sudo dpkg --add-architecture i386


# vscode
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

# eza - modern ls
sudo apt install -y gpg
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list


################################

# Update cache
sudo apt update

#Install
sudo apt install -y code eza

sudo apt install -y net-tools iputils-ping wget git filezilla
sudo apt install -y lutris vlc steam


# Flatpaks
sudo apt install -y flatpak plasma-discover-backend-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub com.discordapp.Discord

# fuck discords "Update feature"
mkdir -p ~/.var/app/com.discordapp.Discord/config/discord/
echo '{
  "IS_MAXIMIZED": true,
  "IS_MINIMIZED": false,
  "WINDOW_BOUNDS": {
    "x": 2240,
    "y": 219,
    "width": 1280,
    "height": 720
  },
  "SKIP_HOST_UPDATE": true
}' > ~/.var/app/com.discordapp.Discord/config/discord/settings.json



# Focusrite Config
sudo bash -c 'echo "options snd_usb_audio vid=0x1235 pid=0x8210 device_setup=1" > /etc/modprobe.d/snd_usb_audio.conf'


# Dev Tools
sudo apt install -y gh

