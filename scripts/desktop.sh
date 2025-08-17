#!/bin/bash

# Desktop Environment Setup
source "$(dirname "$0")/common.sh"

install_desktop_packages() {
    log_info "Installing desktop packages..."
    
    local packages=(
        # Window manager/desktop
        i3-wm i3status i3lock dmenu
        
        # Display manager
        lightdm lightdm-gtk-greeter
        
        # Fonts
        ttf-dejavu ttf-liberation noto-fonts
        
        # GTK themes
        gtk3 gtk4
    )
    
    install_packages "${packages[@]}"
}

configure_lightdm() {
    log_info "Configuring LightDM..."
    
    # Enable lightdm service
    sudo systemctl enable lightdm.service
    log_success "LightDM service enabled"
}

setup_fonts() {
    log_info "Setting up fonts..."
    
    # Create fonts directory if it doesn't exist
    mkdir -p "$HOME/.local/share/fonts"
    
    # Refresh font cache
    fc-cache -fv
    log_success "Font cache refreshed"
}

main() {
    log_info "Setting up desktop environment..."
    
    install_desktop_packages
    configure_lightdm
    setup_fonts
    
    log_success "Desktop environment setup completed"
}

main "$@"