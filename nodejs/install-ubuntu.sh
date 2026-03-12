#!/bin/bash
# install-ubuntu.sh — Node.js via nvm (Ubuntu/Debian)

set -e
echo "=== Node.js + nvm Installer (Ubuntu/Debian) ==="

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install LTS
nvm install --lts
nvm use --lts
nvm alias default 'lts/*'

echo "=== Node.js installed! ==="
node --version && npm --version

echo ""
echo "Add to ~/.bashrc or ~/.zshrc to load nvm automatically:"
echo '  export NVM_DIR="$HOME/.nvm"'
echo '  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"'
