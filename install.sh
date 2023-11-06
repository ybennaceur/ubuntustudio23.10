#!/bin/bash

# Modifier le fichier pacman.conf pour augmenter le nombre de téléchargements parallèles
sed -i "s/^#ParallelDownloads = 5$/ParallelDownloads = 15/" /etc/pacman.conf

# Définir la liste des paquets à installer
paquets=(
  pipewire        # Support audio avec PipeWire
  pipewire-pulse  # Compatibilité PulseAudio pour PipeWire
  alsa-utils      # Utilitaires ALSA pour le support audio
  vim             # Éditeur de texte
  sxiv            # Visionneuse d'images et gestionnaire de fond d'écran
  code            # Visual Studio Code
  xorg            # Système X Window
  xorg-xinit      # Scripts d'initialisation pour le système X Window
  xorg-xset       # Utilitaires du système X Window
  xorg-xrandr     # Configuration d'affichage pour le système X Window
  xorg-xrdb       # Utilitaire de base de données de ressources du système X Window
  xorg-xprop      # Affichage des propriétés du système X Window
  xorg-xdpyinfo   # Utilitaire d'information sur l'affichage du système X Window
  dmenu           # Menu dynamique pour dwm
  alacritty       # Émulateur de terminal Alacritty pour dwm
  networkmanager  # NetworkManager pour la gestion du réseau
  chromium        # Navigateur web Chromium
  xorg-xkill      # Utilitaire pour tuer des applications X11
  xorg-xsetroot   # Utilitaire pour définir le fond d'écran du bureau
  xorg-xbacklight # Contrôle de la luminosité de l'écran
  xorg-xprop      # Affichage des propriétés du système X Window
  zathura         # Visionneuse de documents
  zathura-pdf-mupdf # Prise en charge des fichiers PDF pour Zathura
  mpv             # Lecteur multimédia
  xwallpaper      # Utilitaire pour gérer les fonds d'écran
  xclip           # Gestion du presse-papiers
  zip             # Utilitaire de compression ZIP
  unzip           # Utilitaire pour extraire des fichiers ZIP
  unrar           # Utilitaire pour extraire des fichiers RAR
  p7zip           # Utilitaire de compression 7z
  brightnessctl   # Contrôle de la luminosité de l'écran
  zsh             # Shell Zsh
  rsync           # Utilitaire de synchronisation de fichiers
  libnotify       # Prise en charge des notifications
  dunst           # Gestionnaire de notifications Dunst
  slock           # Écran de verrouillage simple
  zsh-syntax-highlighting # Mise en surbrillance de la syntaxe pour Zsh
)

# Mettre à jour le système et installer les paquets
sudo pacman -Syu

for paquet in "${paquets[@]}"; do
  echo "Installation de $paquet..."
  sudo pacman -S --noconfirm "$paquet"
done

# Activer et démarrer le service NetworkManager
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager

# Activer le service audio
sudo systemctl enable --now pipewire pipewire-pulse

# Nettoyer les paquets mis en cache
sudo pacman -Sc

echo "Installation terminée."
