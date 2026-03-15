#!/bin/bash
# install-ai-lab-ubuntu.sh — Complete AI Lab Setup (Ubuntu/Debian)

set -e

PYTHON_VERSION="${1:-3.12}"
AI_ENV="$HOME/ai-lab"

echo "=== COMPLETE AI LAB INSTALLER (UBUNTU) ==="

# Update system
echo "Updating packages..."
sudo apt-get update

# Install system dependencies
echo "Installing build dependencies..."
sudo apt-get install -y \
curl build-essential git ffmpeg \
libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev \
libncursesw5-dev xz-utils \
libxml2-dev libxmlsec1-dev \
libffi-dev liblzma-dev \
python3-opencv

# Install uv
echo "Installing uv..."
curl -LsSf https://astral.sh/uv/install.sh | sh

export PATH="$HOME/.local/bin:$PATH"

# Install Python
echo "Installing Python $PYTHON_VERSION..."
uv python install "$PYTHON_VERSION"

# Create AI environment
echo "Creating AI environment..."
uv venv "$AI_ENV" --python "$PYTHON_VERSION"

source "$AI_ENV/bin/activate"

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

echo "Installing LLM / AI agent tools..."

uv pip install \
openai \
anthropic \
langchain \
tiktoken

echo "Installing ONNX inference tools..."

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
echo "$AI_ENV"

echo ""
echo "Activate environment:"
echo "source $AI_ENV/bin/activate"

echo ""
echo "Start Jupyter:"
echo "jupyter notebook"

echo ""
echo "Test installation:"
echo "python -c \"import torch,cv2,transformers; print('AI Lab Ready')\""