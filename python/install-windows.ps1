# install-windows.ps1 — Python + uv (Windows)
# Installs uv (fast Python version/package manager) and sets up Python for AI development
# Run as Administrator in PowerShell:
#   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
#   .\install-windows.ps1

param(
    [string]$PythonVersion = "3.12",
    [switch]$InstallAIPackages
)

Write-Host "=== Python + uv Installer (Windows) ===" -ForegroundColor Cyan

# Install uv
Write-Host "Installing uv (Python version & package manager)..." -ForegroundColor Yellow
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"

# Refresh PATH
$env:PATH = [System.Environment]::GetEnvironmentVariable("PATH", "Machine") + ";" +
            [System.Environment]::GetEnvironmentVariable("PATH", "User")

# Install Python
Write-Host "Installing Python $PythonVersion..." -ForegroundColor Yellow
uv python install $PythonVersion

Write-Host "Python $PythonVersion installed!" -ForegroundColor Green

# Optionally install AI packages into a shared virtual environment
if ($InstallAIPackages) {
    Write-Host "Setting up AI development environment..." -ForegroundColor Yellow
    $aiEnvPath = "$env:USERPROFILE\ai-env"
    uv venv $aiEnvPath --python $PythonVersion
    & "$aiEnvPath\Scripts\activate.ps1"
    uv pip install torch torchvision transformers openai anthropic numpy pandas jupyter scikit-learn matplotlib
    Write-Host "AI packages installed in $aiEnvPath" -ForegroundColor Green
}

Write-Host ""
Write-Host "=== Setup complete! ===" -ForegroundColor Green
Write-Host "Quick reference:"
Write-Host "  uv python install 3.11   # install another version"
Write-Host "  uv init my-project       # create a new project"
Write-Host "  uv add torch numpy       # add packages"
Write-Host "  uv run script.py         # run a script"
Write-Host ""
Write-Host "Run with -InstallAIPackages to also install torch, transformers, etc."
