#!/bin/bash

# Définir la liste des paquets à installer
paquets=(
  pipewire        # Support audio avec PipeWire
  pipewire-pulse  # Compatibilité PulseAudio pour PipeWire
  alsa-utils      # Utilitaires ALSA pour le support audio
  vim             # Éditeur de texte
  feh             # Visionneuse d'images et gestionnaire de fond d'écran
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

# Nettoyer les paquets mis en cache
sudo pacman -Sc

echo "Installation terminée."
