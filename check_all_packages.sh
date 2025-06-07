#!/bin/bash

# Script to check all nanc packages for errors and warnings

echo "Checking all nanc packages for errors and warnings..."

# List of packages to check
packages=(
    "nanc"
    "nui"
    "nanc_configuration"
    "nanc_tools"
    "nanc_fonts"
    "nanc_icons"
    "nanc_lints"
    "nanc_analytics"
    "nanc_api_firebase"
    "nanc_api_local"
    "nanc_api_supabase"
    "nui_converter"
    "nui_svg_renderer"
)

# Function to check a package
check_package() {
    local package_name=$1
    local package_path="$package_name"
    
    if [ -d "$package_path" ]; then
        echo "=== Checking $package_name ==="
        cd "$package_path"
        
        # Count errors and warnings
        local errors=$(flutter analyze --no-fatal-infos 2>/dev/null | grep -c "error •")
        local warnings=$(flutter analyze --no-fatal-infos 2>/dev/null | grep -c "warning •")
        
        echo "Errors: $errors, Warnings: $warnings"
        
        # Show first few errors/warnings if any
        if [ $errors -gt 0 ] || [ $warnings -gt 0 ]; then
            flutter analyze --no-fatal-infos 2>/dev/null | grep -E "(error|warning)" | head -5
        fi
        
        cd - > /dev/null
        echo ""
    else
        echo "Package $package_name not found"
    fi
}

# Check each package
for package in "${packages[@]}"; do
    check_package "$package"
done

echo "Package check completed!"
