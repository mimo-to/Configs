# Configuration Repository Documentation

## Overview

This repository contains Windows 11 configuration files, organized to be portable, version-controlled, and easily deployable across systems.

## Directory Structure

```
all_configs/
├── apps/                    # Application-specific configurations
│   ├── productivity/        # Productivity tools (YASB, GlazeWM, etc.)
│   ├── terminal/            # Terminal and shell configurations
│   ├── browsers/            # Browser configurations
│   └── editors/             # Text editor configurations
├── apps/system/             # System tools (Fastfetch, etc.)
├── scripts/                 # Installation and utility scripts
├── templates/               # Template files for new projects
├── docs/                    # Documentation
├── tools/                   # Enhancement tools
├── README.md               # Main repository information
└── .gitignore              # Files to exclude from version control
```

## Current Configurations

### YASB (Yet Another Status Bar)
Location: `apps/productivity/yasb/`
- `config.yaml` - Main configuration for status bar layout and widgets
- `styles.css` - Styling and appearance settings

### GlazeWM (Tiling Window Manager)
Location: `apps/productivity/glazewm/`
- `config.yaml` - Window management rules, keybindings, and behavior

### Windows Terminal
Location: `apps/terminal/windows_terminal/`
- `settings.json` - Terminal profiles, themes, keybindings, and appearance settings

### PowerShell
Location: `apps/terminal/powershell/`
- `Microsoft.PowerShell_profile.ps1` - PowerShell environment customization, aliases, functions, startup scripts

### Fastfetch
Location: `apps/system/fastfetch/`
- System information tool configuration

### Flow Launcher
Location: `tools/flow_launcher/`
- Application launcher configurations
- Plugin settings

### Everything
Location: `tools/everything/`
- File search utility configurations
- Indexing preferences

### ShareX
Location: `tools/sharex/`
- Screen capture tool settings
- Upload destination configurations

### LocalSend
Location: `tools/localsend/`
- Local file sharing configurations
- Security settings

### UniGetUI
Location: `tools/unigetui/`
- Package manager frontend configurations
- Repository settings

### WinToys
Location: `tools/wintoys/`
- System enhancement utilities configurations
- PowerToys Run and FancyZones settings

### Winhance
Location: `tools/winhance/`
- Windows customization and debloating configurations
- Privacy-focused system tweaks

## Setup Instructions

### Prerequisites
- Git installed on your system
- Applications installed per tool requirements

### Installation

1. **Clone this repository:**
   ```
   git clone https://github.com/yourusername/all_configs.git
   cd all_configs
   ```

2. **Run the installation script:**
   - For Command Prompt: `scripts\install.bat`
   - For PowerShell: `scripts\install.ps1` (run in PowerShell)

3. **Restart applications** to apply the new configurations.

### Manual Installation

If you prefer to copy files manually, follow the paths specified for each tool.

## Adding New Configurations

To add a new configuration to this repository:

1. Identify the location of the configuration file
2. Determine the appropriate directory in the repository structure
3. Copy the configuration file to the appropriate location
4. Review the file to ensure no sensitive information is included
5. Add, commit, and push the changes to your repository

### Configuration File Guidelines

When adding configuration files, ensure they:
- Do not contain sensitive information (passwords, API keys, personal data)
- Are in a format that can be easily version controlled (text-based)
- Include comments explaining important settings if not self-explanatory
- Follow the appropriate directory structure

## Security Considerations

This repository follows these security practices:

- No sensitive information is stored in configuration files
- A comprehensive `.gitignore` file prevents accidental commits of sensitive files
- Regular reviews to ensure no private data is included
- Use of environment variables for any sensitive data that must be referenced

## Updating Configurations

To update your configurations from this repository on another machine:

1. Pull the latest changes: `git pull origin main`
2. Run the installation script again or manually copy the updated files
3. Restart the affected applications

## Backup Process

To backup your current configurations to this repository:

1. Update the configuration files in the appropriate directories
2. Commit the changes: `git add .` followed by `git commit -m "Update configurations"`
3. Push the changes: `git push origin main`

## Troubleshooting

### Applications not applying new configurations
- Ensure the applications are completely closed before copying configuration files
- Check file permissions to ensure the application can read the configuration files
- Verify that paths in the configuration files are valid for the current system

### Installation script fails
- Make sure you're running the script from the repository root directory
- Check that you have write permissions to the destination directories
- Ensure PowerShell execution policy allows script execution (for PowerShell script)