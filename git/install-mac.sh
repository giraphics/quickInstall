#!/bin/bash
# install-mac.sh — Git (macOS)

set -e
echo "=== Git Installer (macOS) ==="

if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install git

git config --global core.autocrlf input
git config --global init.defaultBranch main

echo "=== Git installed! ==="
git --version
