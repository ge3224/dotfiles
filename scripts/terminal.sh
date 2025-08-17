#!/bin/bash

# Terminal Environment Setup
source "$(dirname "$0")/common.sh"

install_terminal_packages() {
    log_info "Installing terminal packages..."
    
    local packages=(
        # Terminal emulators
        alacritty
        kitty
        
        # Shells
        zsh
        fish
        
        # Terminal utilities
        tmux
        screen
        
        # Modern replacements
        exa      # ls replacement
        bat      # cat replacement
        fd       # find replacement
        ripgrep  # grep replacement
        htop     # top replacement
        
        # Terminal multiplexer
        zellij
    )
    
    install_packages "${packages[@]}"
}

setup_shell() {
    log_info "Setting up shell environment..."
    
    # Install oh-my-zsh if zsh is installed and oh-my-zsh doesn't exist
    if command -v zsh &> /dev/null && [[ ! -d "$HOME/.oh-my-zsh" ]]; then
        log_info "Installing oh-my-zsh..."
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        log_success "oh-my-zsh installed"
    fi
    
    # Set zsh as default shell if it's installed
    if command -v zsh &> /dev/null; then
        if [[ "$SHELL" != */zsh ]]; then
            log_info "Changing default shell to zsh..."
            chsh -s "$(which zsh)"
            log_success "Default shell changed to zsh (restart terminal to take effect)"
        fi
    fi
}

configure_alacritty() {
    log_info "Setting up Alacritty configuration..."
    
    local config_dir="$HOME/.config/alacritty"
    mkdir -p "$config_dir"
    
    # Only create basic config if none exists
    if [[ ! -f "$config_dir/alacritty.yml" ]]; then
        cat > "$config_dir/alacritty.yml" << 'EOF'
window:
  opacity: 0.95
  
font:
  normal:
    family: DejaVu Sans Mono
  size: 11.0

colors:
  primary:
    background: '#1d1f21'
    foreground: '#c5c8c6'

key_bindings:
  - { key: V, mods: Control|Shift, action: Paste }
  - { key: C, mods: Control|Shift, action: Copy }
EOF
        log_success "Basic Alacritty configuration created"
    fi
}

main() {
    log_info "Setting up terminal environment..."
    
    install_terminal_packages
    setup_shell
    configure_alacritty
    
    log_success "Terminal environment setup completed"
}

main "$@"