# install-windows.ps1 — Emscripten SDK (Windows)
# Run in PowerShell:
#   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
#   .\install-windows.ps1
#
# Optional:
#   .\install-windows.ps1 -InstallDir "C:\emsdk"

param(
    [string]$InstallDir = "C:\emsdk"
)

Write-Host "=== Emscripten SDK Installer (Windows) ===" -ForegroundColor Cyan

# Check for git
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Error "Git not found. Install Git and retry."
    exit 1
}

# Ensure install directory exists
if (!(Test-Path $InstallDir)) {
    Write-Host "Creating directory $InstallDir" -ForegroundColor Yellow
    New-Item -ItemType Directory -Force -Path $InstallDir | Out-Null
}

# Clone or update emsdk
if (Test-Path "$InstallDir\.git") {
    Write-Host "emsdk already cloned - pulling latest..." -ForegroundColor Yellow
    git -C $InstallDir pull
}
else {
    Write-Host "Cloning emsdk to $InstallDir ..." -ForegroundColor Yellow
    git clone https://github.com/emscripten-core/emsdk.git $InstallDir
}

if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to clone or update emsdk. Check your internet connection."
    exit 1
}

Push-Location $InstallDir

Write-Host "Installing latest Emscripten..." -ForegroundColor Yellow
.\emsdk install latest
if ($LASTEXITCODE -ne 0) {
    Pop-Location
    Write-Error "Failed to install latest Emscripten."
    exit 1
}

Write-Host "Activating latest Emscripten..." -ForegroundColor Yellow
.\emsdk activate latest
if ($LASTEXITCODE -ne 0) {
    Pop-Location
    Write-Error "Failed to activate latest Emscripten."
    exit 1
}

Pop-Location

Write-Host ""
Write-Host "Emscripten SDK installed successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "=== HOW TO ACTIVATE (run each new terminal session) ===" -ForegroundColor Cyan
Write-Host "  cd $InstallDir"
Write-Host "  .\emsdk_env.ps1"
Write-Host ""
Write-Host "  Or add this line to your PowerShell profile:"
Write-Host "  . $InstallDir\emsdk_env.ps1"
Write-Host ""
Write-Host "Quick reference (after activating):" -ForegroundColor Cyan
Write-Host "  Verify install:   emcc --version"
Write-Host "  Compile a file:   emcc hello.c -o hello.html"
Write-Host "  Build with CMake:"
Write-Host "    emcmake cmake .."
Write-Host "    emmake make"