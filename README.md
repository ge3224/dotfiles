# Dotfiles

A modular dotfiles setup for Arch Linux with automated installation and configuration scripts. This repository contains configuration files for various tools and applications, along with shell scripts that automate the setup process.

## Features

- **Modular Design**: Individual scripts for different components (core tools, applications, window manager, etc.)
- **Dotfile Management**: Configuration files for Hyprland, Waybar, Neovim, Tmux, Ghostty, and more
- **Automated Setup**: Shell scripts that handle package installation and configuration deployment
- **AUR Support**: Automated installation of AUR packages
- **Environment-based**: Supports different environments via `DEV_ENV` variable

## Requirements

- Arch Linux distribution
- Git installed

## Project Structure

- `files/` - Configuration files and dotfiles
- `runs/` - Installation and setup scripts
- `aur/` - AUR package management
- `run` - Main runner script that executes setup scripts

## Usage

1. Clone this repository:

```bash
git clone https://github.com/ge3224/dotfiles.git
cd dotfiles
```

2. Run all setup scripts:

```bash
DEV_ENV=$(pwd) ./run
```

3. Or run specific components:

```bash
DEV_ENV=$(pwd) ./run core          # Install core system tools
DEV_ENV=$(pwd) ./run hypr          # Setup Hyprland window manager
DEV_ENV=$(pwd) ./run neovim        # Configure Neovim
DEV_ENV=$(pwd) ./run apps          # Install applications
```

4. Use dry-run mode to see what would be executed:

```bash
DEV_ENV=$(pwd) ./run --dry
DEV_ENV=$(pwd) ./run --dry apps    # Dry run for specific component
```

## Contributing

If you have any improvements or fixes, please fork the repository, create a
feature branch, and submit a pull request. Make sure to follow the existing
code style and include descriptive commit messages.

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.
