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
sudo apt install -y lutris vlc steam nextcloud-desktop


# Flatpaks
sudo apt install -y flatpak plasma-discover-backend-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub com.discordapp.Discord
flatpak install -y flathub io.missioncenter.MissionCenter

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
mkdir -p ~/.config/wireplumber/wireplumber.conf.d/
echo 'monitor.alsa.rules = [
  {
    matches = [
      {
        node.name = "~alsa_card.*Scarlett.*"
      }
    ]
    actions = {
      update-props = {
        api.alsa.use-acp = false
        api.alsa.use-ucm = false
      }
    }
  }
]' > ~/.config/wireplumber/wireplumber.conf.d/50-focusrite.conf
sudo update-initramfs -u
pactl set-card-profile alsa_card.usb-Focusrite_Scarlett_2i2_USB_* pro-audio
sudo apt install -y usbutils
mkdir -p ~/.local/bin
echo '#!/bin/bash
sleep 2

DEVICE=$(lsusb | grep 1235: | awk '{print $6}')

if [ -n "$DEVICE" ]; then
    sudo usbreset "$DEVICE"
fi' > ~/.local/bin/reset-scarlett.sh
chmod +x ~/.local/bin/reset-scarlett.sh
mkdir -p ~/.config/autostart-scripts
ln -s ~/.local/bin/reset-scarlett.sh ~/.config/autostart-scripts/


# Dev Tools
sudo apt install -y gh

