#!/bin/bash
# install-ai-lab-mac.sh — Complete AI Lab Setup (macOS)
# Usage:
#   chmod +x install-ai-lab-mac.sh
#   ./install-ai-lab-mac.sh [python-version]
#
# Example:
#   ./install-ai-lab-mac.sh 3.12

set -e

PYTHON_VERSION="${1:-3.12}"
AI_ENV="$HOME/ai-lab"

echo "=== COMPLETE AI LAB INSTALLER (macOS) ==="

# Install Homebrew if needed
if ! command -v brew >/dev/null 2>&1; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Make sure brew is available in this shell
if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

echo "Updating Homebrew..."
brew update

echo "Installing system dependencies..."
brew install \
    curl \
    git \
    cmake \
    pkg-config \
    ffmpeg

# Install uv
echo "Installing uv..."
curl -LsSf https://astral.sh/uv/install.sh | sh

# Ensure uv is on PATH for this shell
export PATH="$HOME/.local/bin:$PATH"

# Install Python
echo "Installing Python $PYTHON_VERSION..."
uv python install "$PYTHON_VERSION"

# Create virtual environment
echo "Creating AI environment at $AI_ENV..."
uv venv "$AI_ENV" --python "$PYTHON_VERSION"

# Activate environment
# shellcheck disable=SC1090
source "$AI_ENV/bin/activate"

echo "Upgrading core packaging tools..."
uv pip install --upgrade pip setuptools wheel

echo "Installing core scientific stack..."
uv pip install \
    numpy \
    pandas \
    scipy \
    matplotlib \
    scikit-learn \
    jupyter \
    notebook \
    ipykernel

echo "Installing deep learning frameworks..."
uv pip install \
    torch \
    torchvision \
    torchaudio \
    transformers \
    accelerate \
    datasets

echo "Installing computer vision stack..."
uv pip install \
    opencv-python \
    opencv-contrib-python \
    mediapipe \
    pillow \
    imageio

echo "Installing audio / speech AI..."
uv pip install \
    openai-whisper \
    ffmpeg-python \
    pydub

echo "Installing LLM / AI app tools..."
uv pip install \
    openai \
    anthropic \
    langchain \
    tiktoken

echo "Installing ONNX / inference tools..."
uv pip install \
    onnx \
    onnxruntime \
    optimum

echo "Installing reinforcement learning tools..."
uv pip install \
    gymnasium \
    stable-baselines3 \
    pygame

echo ""
echo "=== AI LAB INSTALLATION COMPLETE ==="
echo ""
echo "Environment location:"
echo "  $AI_ENV"
echo ""
echo "Activate it with:"
echo "  source \"$AI_ENV/bin/activate\""
echo ""
echo "Start Jupyter with:"
echo "  jupyter notebook"
echo ""
echo "Quick test:"
echo "  python -c \"import torch, cv2, transformers; print('AI Lab Ready')\""
echo ""
echo "Recommended shell config additions (~/.zshrc or ~/.bashrc):"
echo '  export PATH="$HOME/.local/bin:$PATH"'
echo '  [ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"'
echo '  [ -x /usr/local/bin/brew ] && eval "$(/usr/local/bin/brew shellenv)"'
echo ""
echo "Apple Silicon tip:"
echo "  PyTorch on macOS uses Apple Metal (MPS), not CUDA."