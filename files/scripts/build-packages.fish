#!/usr/bin/env fish

set --global packages cargo gtk3-devel gtk-layer-shell-devel openssl-devel libdbusmenu-gtk3-devel pulseaudio-libs-devel libinput-devel luajit-devel lua-lgi make cmake gcc libevdev-devel sccache ffmpeg ffmpeg-libs libavutil-devel
set --global RUSTC_WRAPPER $(which sccache)

sudo dnf install $packages -y

# build ironbar
git clone --depth 1 https://github.com/JakeStanger/ironbar.git
cd ironbar
cargo build --release
sudo install target/release/ironbar /usr/bin/ironbar
cd ..
rm -rf ironbar

# build wl-screenrec
git clone --depth 1 https://github.com/russelltg/wl-screenrec
cd wl-screenrec
cargo build --release
sudo install target/release/wl-screenrec /usr/bin/wl-screenrec
cd ..
rm -rf wl-screenrec

sudo dnf remove $packages -y
sudo dnf autoremove
