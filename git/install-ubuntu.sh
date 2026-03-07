#!/bin/bash
# install-ubuntu.sh — Git (Ubuntu/Debian) — latest via PPA

set -e
echo "=== Git Installer (Ubuntu/Debian) ==="

sudo add-apt-repository -y ppa:git-core/ppa
sudo apt-get update
sudo apt-get install -y git

git config --global core.autocrlf input
git config --global init.defaultBranch main

echo "=== Git installed! ==="
git --version
