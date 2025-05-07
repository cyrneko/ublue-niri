#!/usr/bin/env fish

set --global packages cargo gtk3-devel gtk-layer-shell-devel openssl-devel libdbusmenu-gtk3-devel pulseaudio-libs-devel libinput-devel luajit-devel lua-lgi make cmake gcc libevdev-devel sccache
set --global repos \'terra,https://repos.fyralabs.com/terra$releasever\' terra-release

dnf install --nogpgcheck --repofrompath $repos 

sudo dnf install $packages -y

git clone --depth 1 https://github.com/JakeStanger/ironbar.git
cd ironbar
set --global RUSTC_WRAPPER $(which sccache)
cargo build --release
sudo install target/release/ironbar /usr/bin/ironbar
cd ..
rm -rf ironbar


sudo dnf remove $packages -y
sudo dnf autoremove
