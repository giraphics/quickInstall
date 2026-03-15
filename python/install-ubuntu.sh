#!/bin/bash
# install-ubuntu.sh — Python + uv (Ubuntu/Debian)
# Usage: ./install-ubuntu.sh [python-version]
# Example: ./install-ubuntu.sh 3.12

set -e

PYTHON_VERSION="${1:-3.12}"

echo "=== Python + uv Installer (Ubuntu/Debian) ==="

# Install build dependencies
echo "Installing build dependencies..."
sudo apt-get update
sudo apt-get install -y curl build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev libncursesw5-dev \
    xz-utils libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# Install uv
echo "Installing uv..."
curl -LsSf https://astral.sh/uv/install.sh | sh
source "$HOME/.cargo/env" 2>/dev/null || true
export PATH="$HOME/.local/bin:$PATH"

# Install Python
echo "Installing Python $PYTHON_VERSION..."
uv python install "$PYTHON_VERSION"

echo ""
echo "=== Python $PYTHON_VERSION installed via uv ==="
echo "Add to your shell config (~/.bashrc or ~/.zshrc):"
echo '  export PATH="$HOME/.local/bin:$PATH"'
echo ""
echo "Quick reference:"
echo "  uv python install 3.11   # install another version"
echo "  uv init my-project       # create a new project"
echo "  uv add torch numpy       # add packages"
echo "  uv run script.py         # run a script"
