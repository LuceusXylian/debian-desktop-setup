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
sudo apt-get install -y wget gpg apt-transport-https


# vscode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

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

sudo apt install -y net-tools iputils-ping steam wget git filezilla

sudo apt install -y lutris vlc


# Flatpaks
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
