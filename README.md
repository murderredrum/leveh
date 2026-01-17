# Hevel - Scrollable Floating Window Manager for Wayland

## Description

Hevel is a scrollable, floating window manager for Wayland that uses mouse chords for commands. Its design is inspired by the ideas found in Rob Pike's 1988 paper, 'Window Systems Should be Transparent', taken to their logical extremes. As such, you could say it is a modernization of the line of mouse-driven Unix/Plan9 window systems, mux, 8½, and rio, all created by Rob Pike. However, it differs in the fact that there are no menus, and you are not limited to a single screen worth of space; you are able to infinitely scroll up and down, creating windows anywhere on the plane.

It is implemented using the wonderful swc library, with several extensions.

Hevel is the flagship window manager designed and implemented for use with [dérive linux](https://derivelinux.org)

## Features

- Scrollable desktop workspace
- Mouse chord-based controls
- Floating windows
- Multi-screen support
- Auto-scrolling when moving windows to screen edges
- Window killing via chords
- Terminal spawning capabilities

## Installation on Arch Linux

### Installing Dependencies

To install Hevel on Arch Linux, you need to install the following dependencies:

```bash
sudo pacman -S base-devel wayland wayland-protocols libinput pixman xorg-xkbcomp xkeyboard-config libdrm libudev xcb-util xcb-util-wm xcb-util-image xcb-util-cursor
```

You'll also need to install WLD (Wayland Display library):

```bash
git clone https://github.com/michaelforney/wld.git
cd wld
make
sudo make install
```

And SWC - the core library that Hevel is built upon:

```bash
git clone https://github.com/michaelforney/swc.git
cd swc
make
sudo make install
```

### Building and Installing Hevel

```bash
# Clone the repository (if not already done)
git clone https://github.com/your-repo/hevel.git
cd hevel

# Build the project
make

# Install
sudo make install
```

## Mouse Chord Commands

Commands are issued using mouse chords, meaning by pressing combinations of buttons on the mouse. Left click is referred to as 1, clicking the scroll wheel as 2, and right click as 3.

- **1 -> 3 -> drag -> release** - creates a new terminal in the dragged box
- **3 -> 1 -> move mouse on top of target window -> release** - kill target window
- **3 -> 2 -> release 2, and with your finger still on the scroll wheel, scroll up/down** - scroll the entire workspace
- **2 -> 3 -> release 2 on top of a window, and then drag with 3 to resize said window**
- **2 -> 1 -> release 2 on top of a window, and then drag with 1 to move said window. if you drag to the bottom/top of the screen, it will begin to scroll.**

## Configuration

Configuration is done through the `config.h` file at compile time. Key parameters include:

- Window border colors (active/inactive)
- Border widths
- Scrolling settings
- Cursor theme
- Terminal spawning parameters
- Auto-scroll thresholds during window movement

## Running

Hevel can be run directly or as part of a Wayland session:

```bash
# Simple run
./hevel

# Or via script
./starthevel.sh
```

## Optimizations for Arch Linux

### 1. Improved Makefile for Arch

Updated Makefile for better Arch Linux compatibility:

- Updated library paths
- Added support for standard Arch installation paths
- Using system libraries instead of bundled ones

### 2. Enhanced Hardware Support

- Optimization for modern Arch hardware
- Better graphics driver support
- Improved handling of various monitor configurations

### 3. Systemd Integration

Provided unit for launching in Wayland session via systemd:

```ini
[Unit]
Description=Hevel Wayland Compositor
After=graphical-session.target

[Service]
Type=simple
ExecStart=/usr/local/bin/hevel
Restart=on-failure

[Install]
WantedBy=graphical-session.target
```

## Troubleshooting

### Startup Issues

If you encounter issues with startup:

1. Make sure the `WAYLAND_DISPLAY` variable isn't set to another session:
   ```bash
   unset WAYLAND_DISPLAY
   ```

2. Check permissions for input devices:
   ```bash
   ls -la /dev/input/
   ```

3. Ensure all dependencies are installed.

### Display Issues

If you have display problems:

1. Check DRM support:
   ```bash
   lsmod | grep drm
   ```

2. Make sure you're running from a TTY, not from another X11/Wayland session.

## License

Keep in mind this is EXPERIMENTAL SOFTWARE! Use at your own risk.

The project is distributed under the license specified in the LICENSE file.

For detailed Russian documentation, see README_RU.md.






