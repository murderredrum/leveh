#!/bin/bash
# Hevel Wayland Compositor startup script for Arch Linux

# Check for available terminals before starting
echo "Проверка наличия поддерживаемых терминалов..."
./check_terminals.sh

# Terminate any existing wayland sessions
export DISPLAY=""
unset WAYLAND_DISPLAY

# Set environment variables for Wayland
export XDG_SESSION_TYPE=wayland
export GDK_BACKEND=wayland
export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export CLUTTER_BACKEND=wayland
export SDL_VIDEODRIVER=wayland

# Start the compositor with logging
swc-launch ./hevel 2>&1 | tee hevel_final.log
