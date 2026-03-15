# install-ai-lab.ps1 — Complete AI Lab Setup (Windows)

param(
    [string]$PythonVersion = "3.12"
)

Write-Host "=== COMPLETE AI LAB INSTALLER ===" -ForegroundColor Cyan

# Install uv
Write-Host "Installing uv (fast Python manager)..." -ForegroundColor Yellow
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"

# Refresh PATH
$env:PATH = [System.Environment]::GetEnvironmentVariable("PATH", "Machine") + ";" +
            [System.Environment]::GetEnvironmentVariable("PATH", "User")

# Install Python
Write-Host "Installing Python $PythonVersion..." -ForegroundColor Yellow
uv python install $PythonVersion

# Create AI environment
$aiEnvPath = "$env:USERPROFILE\ai-lab"
Write-Host "Creating AI environment at $aiEnvPath..." -ForegroundColor Yellow
uv venv $aiEnvPath --python $PythonVersion

# Activate environment
& "$aiEnvPath\Scripts\activate.ps1"

Write-Host "Installing core AI packages..." -ForegroundColor Yellow

uv pip install `
numpy `
pandas `
matplotlib `
scikit-learn `
scipy `
jupyter `
notebook `
ipykernel

Write-Host "Installing Deep Learning frameworks..." -ForegroundColor Yellow

uv pip install `
torch `
torchvision `
torchaudio `
transformers `
accelerate `
datasets

Write-Host "Installing Computer Vision packages..." -ForegroundColor Yellow

uv pip install `
opencv-python `
opencv-contrib-python `
mediapipe `
pillow `
imageio

Write-Host "Installing Audio / Speech AI..." -ForegroundColor Yellow

uv pip install `
openai-whisper `
ffmpeg-python `
pydub

Write-Host "Installing LLM / AI APIs..." -ForegroundColor Yellow

uv pip install `
openai `
anthropic `
langchain `
tiktoken

Write-Host "Installing ONNX / inference tools..." -ForegroundColor Yellow

uv pip install `
onnx `
onnxruntime `
optimum

Write-Host "Installing reinforcement learning tools..." -ForegroundColor Yellow

uv pip install `
gymnasium `
stable-baselines3 `
pygame

Write-Host ""
Write-Host "=== AI LAB READY ===" -ForegroundColor Green

Write-Host ""
Write-Host "Environment path:"
Write-Host $aiEnvPath

Write-Host ""
Write-Host "Activate AI Lab with:"
Write-Host "$aiEnvPath\Scripts\activate"

Write-Host ""
Write-Host "Run Jupyter:"
Write-Host "jupyter notebook"

Write-Host ""
Write-Host "Example test:"
Write-Host "python -c `"import torch,cv2,transformers; print('AI Lab Ready')`""