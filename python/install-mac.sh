#!/bin/bash
# install-mac.sh — Python + uv (macOS)
# Usage: ./install-mac.sh [python-version]

set -e

PYTHON_VERSION="${1:-3.12}"

echo "=== Python + uv Installer (macOS) ==="

# Install Homebrew if needed
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install uv
echo "Installing uv..."
curl -LsSf https://astral.sh/uv/install.sh | sh
export PATH="$HOME/.local/bin:$PATH"

# Install Python
echo "Installing Python $PYTHON_VERSION..."
uv python install "$PYTHON_VERSION"

echo ""
echo "=== Python $PYTHON_VERSION installed via uv ==="
echo "Add to ~/.zshrc:"
echo '  export PATH="$HOME/.local/bin:$PATH"'
echo ""
echo "Quick reference:"
echo "  uv python install 3.11   # install another version"
echo "  uv init my-project       # create a new project"
echo "  uv add torch numpy       # add packages"
