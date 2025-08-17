#!/bin/bash

# Development Environment Setup
source "$(dirname "$0")/common.sh"

install_development_packages() {
    log_info "Installing development packages..."
    
    local packages=(
        # Version control
        git
        
        # Build tools
        base-devel
        
        # Languages and runtimes
        nodejs npm
        python python-pip
        go
        
        # Docker
        docker docker-compose
        
        # Database tools
        postgresql-client
        
        # Development utilities
        tmux
        tree
        htop
        fd
        bat
        exa
    )
    
    install_packages "${packages[@]}"
}

configure_docker() {
    log_info "Configuring Docker..."
    
    # Add user to docker group
    sudo usermod -aG docker "$USER"
    
    # Enable and start docker service
    sudo systemctl enable docker.service
    sudo systemctl start docker.service
    
    log_success "Docker configured (logout/login required for group changes)"
}

setup_git_config() {
    log_info "Setting up Git configuration..."
    
    # Only set if not already configured
    if ! git config --global user.name &>/dev/null; then
        log_warning "Git user.name not set - please run: git config --global user.name 'Your Name'"
    fi
    
    if ! git config --global user.email &>/dev/null; then
        log_warning "Git user.email not set - please run: git config --global user.email 'your.email@example.com'"
    fi
    
    # Set useful defaults
    git config --global init.defaultBranch main
    git config --global pull.rebase false
    
    log_success "Git configuration updated"
}

main() {
    log_info "Setting up development environment..."
    
    install_development_packages
    configure_docker
    setup_git_config
    
    log_success "Development environment setup completed"
}

main "$@"