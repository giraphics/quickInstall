#!/bin/bash
# install-mac.sh — Visual Studio Code (macOS)

set -e
echo "=== VS Code Installer (macOS) ==="

if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install --cask visual-studio-code

echo "=== VS Code installed! ==="
code --version 2>/dev/null || echo "Launch with: code"
