#!/bin/bash

## Packages from external package managers
## (pip, npm, ruby gems)

pkg_install_all() {
  pkg_install_pip
  pkg_install_npm
  pkg_install_gem
  pkg_install_git_yay
  pkg_install_git_hugo
  pkg_install_curl_rust
}

pkg_install_pip() {
  python3 -m pip install --user virtualenv pylint black yapf mkdocs mkdocs-material
}

pkg_install_npm() {
  sudo npm install -g standard eslint prettier
}

pkg_install_gem() {
  gem install mdl
}

## Packages from git repos
## (git is a requirement)

mk_src_build_dir() {
  mkdir -p "$HOME/src/build"
}

pkg_install_git_yay() {
  mk_src_build_dir
  git clone https://aur.archlinux.org/yay.git || exit
  cd yay || exit
  makepkg -si
}

pkg_install_git_hugo() {
  mk_src_build_dir
  git clone https://github.com/gohugoio/hugo.git
  cd hugo || exit
  go install
}

## Packages installed with shell scripts
## (curl output piped into shell)

pkg_install_curl_rust() {
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

