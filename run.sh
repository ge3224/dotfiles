#!/bin/bash

# Modular setup runner - inspired by ThePrimeagen's approach
# Run specific modules or all modules for system setup

set -e

# Check for DEV_ENV environment variable
if [[ -z "$DEV_ENV" ]]; then
    echo "Error: DEV_ENV environment variable is required"
    echo "Usage: DEV_ENV=\$(pwd) ./run [options] [modules...]"
    echo "   or: DEV_ENV=/path/to/dotfiles ./run [options] [modules...]"
    exit 1
fi

# Use DEV_ENV as the script directory
SCRIPT_DIR="$DEV_ENV"
if [[ ! -f "$SCRIPT_DIR/scripts/common.sh" ]]; then
    echo "Error: scripts/common.sh not found in DEV_ENV: $DEV_ENV"
    exit 1
fi

source "$SCRIPT_DIR/scripts/common.sh"

# Available modules
MODULES=(
    "system"
    "desktop" 
    "terminal"
    "development"
)

# Help function
show_help() {
    cat << EOF
Usage: DEV_ENV=\$(pwd) $0 [OPTIONS] [MODULES...]

Setup your development environment using modular bash scripts.

OPTIONS:
    -h, --help          Show this help message
    -l, --list          List available modules
    -a, --all           Run all modules
    -d, --dry-run       Show what would be executed without running
    --skip-update       Skip system package update

MODULES:
    ${MODULES[*]}

Examples:
    DEV_ENV=\$(pwd) $0 --all                    # Run all modules
    DEV_ENV=\$(pwd) $0 system terminal          # Run only system and terminal modules
    DEV_ENV=\$(pwd) $0 --dry-run development    # Show what development module would do
    DEV_ENV=\$(pwd) $0 --list                   # List all available modules

EOF
}

# List modules
list_modules() {
    log_info "Available modules:"
    for module in "${MODULES[@]}"; do
        echo "  - $module"
    done
}

# Check if module exists
module_exists() {
    local module="$1"
    for m in "${MODULES[@]}"; do
        if [[ "$m" == "$module" ]]; then
            return 0
        fi
    done
    return 1
}

# Run a single module
run_module() {
    local module="$1"
    local script_path="$SCRIPT_DIR/scripts/${module}.sh"
    
    if [[ ! -f "$script_path" ]]; then
        log_error "Module script not found: $script_path"
        return 1
    fi
    
    if [[ "$DRY_RUN" == true ]]; then
        log_info "Would execute: $script_path"
        return 0
    fi
    
    log_info "Running module: $module"
    chmod +x "$script_path"
    
    if "$script_path"; then
        log_success "Module '$module' completed successfully"
    else
        log_error "Module '$module' failed"
        return 1
    fi
}

# Main function
main() {
    local modules_to_run=()
    local run_all=false
    local dry_run=false
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            -h|--help)
                show_help
                exit 0
                ;;
            -l|--list)
                list_modules
                exit 0
                ;;
            -a|--all)
                run_all=true
                shift
                ;;
            -d|--dry-run)
                DRY_RUN=true
                shift
                ;;
            --skip-update)
                export SKIP_UPDATE=true
                shift
                ;;
            -*)
                log_error "Unknown option: $1"
                show_help
                exit 1
                ;;
            *)
                if module_exists "$1"; then
                    modules_to_run+=("$1")
                else
                    log_error "Unknown module: $1"
                    log_info "Available modules: ${MODULES[*]}"
                    exit 1
                fi
                shift
                ;;
        esac
    done
    
    # Determine what to run
    if [[ "$run_all" == true ]]; then
        modules_to_run=("${MODULES[@]}")
    elif [[ ${#modules_to_run[@]} -eq 0 ]]; then
        log_error "No modules specified. Use --all or specify modules."
        show_help
        exit 1
    fi
    
    # Check prerequisites
    check_arch
    
    log_info "Starting setup with modules: ${modules_to_run[*]}"
    
    if [[ "$DRY_RUN" == true ]]; then
        log_warning "DRY RUN MODE - No changes will be made"
    fi
    
    # Run system update first if system module is included and not skipped
    if [[ " ${modules_to_run[*]} " =~ " system " ]] && [[ "$SKIP_UPDATE" != true ]] && [[ "$DRY_RUN" != true ]]; then
        log_info "Updating system packages..."
        sudo pacman -Syu --noconfirm
        log_success "System updated"
    fi
    
    # Run each module
    for module in "${modules_to_run[@]}"; do
        run_module "$module"
    done
    
    log_success "Setup completed successfully!"
    
    if [[ "$DRY_RUN" != true ]]; then
        log_info "You may need to:"
        log_info "  - Logout and login again for group changes to take effect"
        log_info "  - Restart your terminal for shell changes"
        log_info "  - Reboot for some system changes to take effect"
    fi
}

main "$@"