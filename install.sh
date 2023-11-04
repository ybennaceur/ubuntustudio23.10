#!/bin/bash

packages=(

)
sudo pacman -Syu

for package in "${packages[@]}"; do
  echo "Installation $package..."
  sudo pacman -S --noconfirm "$package"
done

sudo pacman -Sc

echo "Installation fini."
