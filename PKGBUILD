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
makedepends=('base-devel' 'wld' 'git')
optdepends=('swc: Core library for hevel')
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
}