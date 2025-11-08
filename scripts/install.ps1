# PowerShell Setup script for Windows 11 configurations
# This script will copy configuration files to their appropriate locations

Write-Host "Windows 11 Configuration Setup Script" -ForegroundColor Green
Write-Host "=====================================" -ForegroundColor Green

# Define source and destination directories
$SourceDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$SourceDir = Join-Path $SourceDir ""  # Ensure trailing slash
$YasbConfigDir = Join-Path $env:APPDATA "yasb"
$GlazeWMConfigDir = Join-Path $env:APPDATA "glaze-wm"
$PowerShellDir = Join-Path $env:USERPROFILE "Documents\WindowsPowerShell"
$TerminalDir = Join-Path $env:LOCALAPPDATA "Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
$FastfetchDir = Join-Path $env:USERPROFILE ".config\fastfetch"

# Create destination directories if they don't exist
if (!(Test-Path $YasbConfigDir)) {
    New-Item -ItemType Directory -Path $YasbConfigDir -Force
    Write-Host "Created YASB config directory: $YasbConfigDir"
}

if (!(Test-Path $GlazeWMConfigDir)) {
    New-Item -ItemType Directory -Path $GlazeWMConfigDir -Force
    Write-Host "Created GlazeWM config directory: $GlazeWMConfigDir"
}

if (!(Test-Path $PowerShellDir)) {
    New-Item -ItemType Directory -Path $PowerShellDir -Force
    Write-Host "Created PowerShell profile directory: $PowerShellDir"
}

if (!(Test-Path $FastfetchDir)) {
    New-Item -ItemType Directory -Path $FastfetchDir -Force
    Write-Host "Created Fastfetch config directory: $FastfetchDir"
}

# Copy YASB configurations
Write-Host "`nCopying YASB configurations..." -ForegroundColor Yellow

$YasbConfigSource = Join-Path $SourceDir "apps\productivity\yasb\config.yaml"
if (Test-Path $YasbConfigSource) {
    Copy-Item $YasbConfigSource $YasbConfigDir -Force
    Write-Host "Copied YASB config.yaml" -ForegroundColor Cyan
}

$YasbStylesSource = Join-Path $SourceDir "apps\productivity\yasb\styles.css"
if (Test-Path $YasbStylesSource) {
    Copy-Item $YasbStylesSource $YasbConfigDir -Force
    Write-Host "Copied YASB styles.css" -ForegroundColor Cyan
}

# Instructions for YASB launchpad if it exists
$LaunchpadSource = Join-Path $SourceDir "apps\productivity\yasb\launchpad"
if (Test-Path $LaunchpadSource) {
    Write-Host "Found launchpad configuration - please manually copy this to your YASB launchpad directory" -ForegroundColor Red
}

# Copy GlazeWM configurations
Write-Host "`nCopying GlazeWM configurations..." -ForegroundColor Yellow

$GlazeWMConfigSource = Join-Path $SourceDir "apps\productivity\glazewm\config.yaml"
if (Test-Path $GlazeWMConfigSource) {
    Copy-Item $GlazeWMConfigSource $GlazeWMConfigDir -Force
    Write-Host "Copied GlazeWM config.yaml" -ForegroundColor Cyan
}

# Copy PowerShell profile
Write-Host "`nCopying PowerShell profile..." -ForegroundColor Yellow

$PowerShellProfileSource = Join-Path $SourceDir "apps\terminal\powershell\Microsoft.PowerShell_profile.ps1"
if (Test-Path $PowerShellProfileSource) {
    Copy-Item $PowerShellProfileSource $PowerShellDir -Force
    Write-Host "Copied PowerShell profile" -ForegroundColor Cyan
}

# Instructions for YASB launchpad if it exists
$LaunchpadSource = Join-Path $SourceDir "apps\productivity\yasb\launchpad"
if (Test-Path $LaunchpadSource) {
    Write-Host "Found launchpad configuration - please manually copy this to your YASB launchpad directory" -ForegroundColor Red
}

# Copy Windows Terminal settings
Write-Host "`nCopying Windows Terminal settings..." -ForegroundColor Yellow

$TerminalSettingsSource = Join-Path $SourceDir "apps\terminal\windows_terminal\settings.json"
if (Test-Path $TerminalSettingsSource) {
    # Check if Windows Terminal directory exists (user needs to open Windows Terminal at least once)
    if (Test-Path $TerminalDir) {
        Copy-Item $TerminalSettingsSource $TerminalDir -Force
        Write-Host "Copied Windows Terminal settings.json" -ForegroundColor Cyan
    } else {
        Write-Host "Windows Terminal config directory not found. Please open Windows Terminal at least once before running this script." -ForegroundColor Red
    }
}

# Copy Fastfetch configurations
Write-Host "`nCopying Fastfetch configurations..." -ForegroundColor Yellow

$FastfetchConfigSource = Join-Path $SourceDir "apps\system\fastfetch\config.txt"
if (Test-Path $FastfetchConfigSource) {
    # Note: The user needs to update the actual Fastfetch config file
    Write-Host "Fastfetch configuration found. Copy to your Fastfetch config directory as needed." -ForegroundColor Cyan
}

Write-Host "`nConfiguration setup completed!" -ForegroundColor Green
Write-Host "Please restart YASB, GlazeWM, and Windows Terminal to apply the new configurations." -ForegroundColor Green
Write-Host "PowerShell changes will take effect in new PowerShell sessions." -ForegroundColor Green
Write-Host "If these applications are not installed, you will need to install them first:" -ForegroundColor Green
Write-Host "- YASB: https://github.com/tonix64/yasb" -ForegroundColor Green
Write-Host "- GlazeWM: https://github.com/glazerdesktop/GlazeWM" -ForegroundColor Green
Write-Host "- Fastfetch: https://github.com/fastfetch-cli/fastfetch" -ForegroundColor Green