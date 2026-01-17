#!/bin/bash

# Installation script for Hevel on Arch Linux

echo "Installing Hevel Wayland Compositor on Arch Linux..."

# Update package database
sudo pacman -Sy

# Install required dependencies
echo "Installing dependencies..."
sudo pacman -S --needed base-devel wayland wayland-protocols libinput pixman xorg-xkbcomp xkeyboard-config libdrm libudev xcb-util xcb-util-wm xcb-util-image xcb-util-cursor wld

# Install SWC library if not present
if [ ! -d "swc" ]; then
    echo "Installing SWC library..."
    git clone https://github.com/michaelforney/swc.git
    cd swc
    make
    sudo make install
    cd ..
fi

# Build Hevel
echo "Building Hevel..."
make

# Install Hevel
echo "Installing Hevel..."
sudo make install

# Install systemd service file
echo "Installing systemd service file..."
sudo cp hevel.service /etc/systemd/user/

# Create default config directory if needed
mkdir -p ~/.config/hevel

echo "Installation complete!"
echo ""
echo "To run Hevel directly:"
echo "  ./hevel"
echo ""
echo "Or to integrate with systemd:"
echo "  systemctl --user enable hevel.service"
echo "  systemctl --user start hevel.service"
echo ""
echo "Note: You may need to logout/login or restart your session for the changes to take effect."