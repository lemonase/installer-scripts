#!/bin/bash

# This script will check the packcage manager and install base packages
# that will be used to install other things down the line.

install_packages() {
  if [ -x "$(command -v pacman)" ]; then
    pkg_install_arch
  fi
  if [ -x "$(command -v apt-get)" ]; then
    pkg_install_debian
  fi
}

## System level packages
## Includes correct packages for arch and debian

pkg_install_arch() {
  sudo pacman -Syu \
              base-devel \
              tree \
              htop \
              tmux \
              ripgrep \
              jq \
              gvim \
              iputils \
              curl \
              git \
              rsync \
              rclone \
              python \
              python-pip \
              go \
              ruby \
              rubygems \
              nodejs \
              npm \
              shellcheck \
              hugo \
              docker \
              docker-compose \
              firefox \
              chromium \
              steam \
              gimp \
              youtube-dl
}

pkg_install_debian() {
  sudo apt-get update
  sudo apt-get install \
              build-essential \
              tree \
              htop \
              tmux \
              ripgrep \
              jq \
              vim-gtk3 \
              iputils-* \
              curl \
              git \
              rsync \
              rclone \
              python3 \
              python3-pip \
              golang \
              ruby \
              nodejs \
              npm \
              shellcheck \
              hugo \
              docker.io \
              docker-compose \
              chromium \
              gimp \
              youtube-dl
}

install_packages
