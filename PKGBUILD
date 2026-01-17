# Maintainer: Your Name <your.email@example.com>
pkgname=hevel
pkgver=1.0
pkgrel=1
pkgdesc="A scrollable, floating window manager for Wayland using mouse chords for commands"
arch=('x86_64')
url="https://github.com/hevelwm/hevel"
license=('MIT')
depends=('wayland' 'wayland-protocols' 'libinput' 'pixman' 'xkeyboard-config' 
         'libdrm' 'libudev' 'xcb-util' 'xcb-util-wm' 'xcb-util-image' 'xcb-util-cursor')
makedepends=('base-devel' 'wld' 'git' 'xorg-xkbcomp')
optdepends=('swc: Core library for hevel'
            'foot: Default terminal emulator'
            'alacritty: Alternative terminal emulator'
            'kitty: Alternative terminal emulator'
            'xterm: Basic terminal emulator'
            'rxvt-unicode: Customizable terminal emulator'
            'gnome-terminal: GNOME terminal emulator')
source=("git+https://github.com/hevelwm/hevel.git"
        "git+https://github.com/michaelforney/swc.git")
sha256sums=('SKIP'
            'SKIP')

build() {
  cd "$srcdir/swc"
  make

  cd "$srcdir/hevel"
  make
}

package() {
  cd "$srcdir/hevel"
  make DESTDIR="$pkgdir" install
  
  # Install systemd service file
  install -Dm644 hevel.service "$pkgdir/usr/lib/systemd/user/hevel.service"
  
  # Install helper scripts
  install -Dm755 check_terminals.sh "$pkgdir/usr/bin/check_hevel_terminals"
  install -Dm755 starthevel.sh "$pkgdir/usr/bin/starthevel"
}