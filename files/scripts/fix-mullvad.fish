#!/usr/bin/env fish

echo "downloading RPM and extracting..."
mkdir -p mullvad-extract
cd mullvad-extract
curl -L --progress-bar "https://mullvad.net/en/download/app/rpm/latest" --output "mullvad.rpm"
echo "rpm2archive is not verbose. Trust me it is doing *something* right now"
rpm2archive ./mullvad.rpm | tee mullvad.rpm.tgz
mkdir extract -p
tar xvf mullvad.rpm.tgz -C extract
mkdir -p /usr/share/mullvad-gui/
cp -r extract/opt/Mullvad\ VPN /usr/share/mullvad-gui/

echo '\
[Desktop Entry]
Name=Mullvad VPN
Exec="/usr/share/mullvad-gui/Mullvad VPN/mullvad-vpn" %U
Terminal=false
Type=Application
Icon=mullvad-vpn
StartupWMClass=Mullvad VPN
Comment=Mullvad VPN client
Categories=Network;\
' | tee /usr/share/applications/mullvad-vpn.desktop
