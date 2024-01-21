#!/bin/bash

sudo apt update && upgrade
snap remove firefox
sudo apt purge elisa pikopixel.app libreoffice*

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo add-apt-repository ppa:flatpak/stable
sudo apt update
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo apt install brave-browser flatpak plasma-discover-backend-flatpak strawberry brave-browser picard timeshift qbittorrent mpv ttf-mscorefonts-installer tiled

flatpak install com.discordapp.Discord
flatpak install com.visualstudio.code
flatpak install org.godotengine.Godot
flatpak install com.spotify.Client
flatpak install com.orama_interactive.Pixelorama
flatpak install org.onlyoffice.desktopeditors

sudo apt autoremove
