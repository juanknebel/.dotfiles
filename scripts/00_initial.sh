#!/bin/sh

# Arch
sudo pacman -S git fish keepassxc;

# Ubuntu
sudo apt install fish git;

# All
git clone git@github.com:juanknebel/.dotfiles.git;
mkdir -p $HOME/git;
