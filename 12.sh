#!/bin/bash
echo "macOS 或 Linux 可用：   brew install gum"
echo "Arch Linux (btw) 可用：  pacman -S gum"
echo "Nix   可用：  nix-env -iA nixpkgs.gum"
echo "Debian/Ubuntu   可用：  
      echo 'deb [trusted=yes] https://repo.charm.sh/apt/ /' | sudo tee /etc/apt/sources.list.d/charm.list
      sudo apt update && sudo apt install gum "
echo "Fedora 可用：  
      echo '[charm]
      name=Charm
      baseurl=https://repo.charm.sh/yum/
      enabled=1
      gpgcheck=0' | sudo tee /etc/yum.repos.d/charm.repo
      sudo yum install gum "
echo 'deb [trusted=yes] https://repo.charm.sh/apt/ /' | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update && sudo apt install gum
