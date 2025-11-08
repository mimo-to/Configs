@echo off
setlocal enabledelayedexpansion

REM Setup script for Windows 11 configurations
REM This script will copy configuration files to their appropriate locations

echo Windows 11 Configuration Setup Script
echo =====================================

REM Define source and destination directories
set "SOURCE_DIR=%~dp0"
set "YASB_CONFIG_DIR=%APPDATA%\yasb"
set "GLAZEWMM_CONFIG_DIR=%APPDATA%\glaze-wm"
set "POWERSHELL_DIR=%USERPROFILE%\Documents\WindowsPowerShell"
set "TERMINAL_DIR=%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
set "FASTFETCH_DIR=%USERPROFILE%\.config\fastfetch"

REM Create destination directories if they don't exist
if not exist "%YASB_CONFIG_DIR%" mkdir "%YASB_CONFIG_DIR%"
if not exist "%GLAZEWMM_CONFIG_DIR%" mkdir "%GLAZEWMM_CONFIG_DIR%"
if not exist "%POWERSHELL_DIR%" mkdir "%POWERSHELL_DIR%"
if not exist "%FASTFETCH_DIR%" mkdir "%FASTFETCH_DIR%"

REM Copy YASB configurations
echo Copying YASB configurations...
if exist "%SOURCE_DIR%apps\productivity\yasb\config.yaml" (
    copy "%SOURCE_DIR%apps\productivity\yasb\config.yaml" "%YASB_CONFIG_DIR%\config.yaml"
    echo Copied YASB config.yaml
)
if exist "%SOURCE_DIR%apps\productivity\yasb\styles.css" (
    copy "%SOURCE_DIR%apps\productivity\yasb\styles.css" "%YASB_CONFIG_DIR%\styles.css"
    echo Copied YASB styles.css
)

REM Copy GlazeWM configurations
echo Copying GlazeWM configurations...
if exist "%SOURCE_DIR%apps\productivity\glazewm\config.yaml" (
    copy "%SOURCE_DIR%apps\productivity\glazewm\config.yaml" "%GLAZEWMM_CONFIG_DIR%\config.yaml"
    echo Copied GlazeWM config.yaml
)

REM Copy PowerShell profile
echo Copying PowerShell profile...
if exist "%SOURCE_DIR%apps\terminal\powershell\Microsoft.PowerShell_profile.ps1" (
    copy "%SOURCE_DIR%apps\terminal\powershell\Microsoft.PowerShell_profile.ps1" "%POWERSHELL_DIR%\Microsoft.PowerShell_profile.ps1"
    echo Copied PowerShell profile
)

REM Instructions for YASB launchpad if it exists
if exist "%SOURCE_DIR%apps\productivity\yasb\launchpad" (
    echo Found launchpad configuration - please manually copy this to your YASB launchpad directory
)

REM Copy Windows Terminal settings
echo Copying Windows Terminal settings...
if exist "%SOURCE_DIR%apps\terminal\windows_terminal\settings.json" (
    if exist "%TERMINAL_DIR%" (
        copy "%SOURCE_DIR%apps\terminal\windows_terminal\settings.json" "%TERMINAL_DIR%\settings.json"
        echo Copied Windows Terminal settings.json
    ) else (
        echo Windows Terminal config directory not found. Please open Windows Terminal at least once before running this script.
    )
)

REM Copy Fastfetch configurations
echo Copying Fastfetch configurations...
if exist "%SOURCE_DIR%apps\system\fastfetch\config.txt" (
    echo Fastfetch configuration found. Copy to your Fastfetch config directory as needed.
)

echo.
echo Configuration setup completed!
echo.
echo Please restart YASB, GlazeWM, and Windows Terminal to apply the new configurations.
echo PowerShell changes will take effect in new PowerShell sessions.
echo If these applications are not installed, you will need to install them first:
echo - YASB: https://github.com/tonix64/yasb
echo - GlazeWM: https://github.com/glazerdesktop/GlazeWM
echo - Fastfetch: https://github.com/fastfetch-cli/fastfetch

pause