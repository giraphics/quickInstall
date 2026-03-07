# install-windows.ps1 — CMake (Windows)
# Run as Administrator in PowerShell

Write-Host "=== CMake Installer (Windows) ===" -ForegroundColor Cyan

if (Get-Command winget -ErrorAction SilentlyContinue) {
    winget install Kitware.CMake --accept-package-agreements --accept-source-agreements
} elseif (Get-Command choco -ErrorAction SilentlyContinue) {
    choco install cmake -y
} else {
    Write-Host "Neither winget nor Chocolatey found." -ForegroundColor Red
    Write-Host "Download from: https://cmake.org/download/" -ForegroundColor Yellow
    exit 1
}

Write-Host "CMake installed!" -ForegroundColor Green
Write-Host "Verify: cmake --version"
