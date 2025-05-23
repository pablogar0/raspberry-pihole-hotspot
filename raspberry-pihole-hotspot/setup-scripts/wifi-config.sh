#!/bin/bash
echo "⚙️  Añadir nueva red Wi-Fi"
read -p "SSID: " ssid
read -sp "Contraseña: " psk
echo

cat <<EOF > /etc/wpa_supplicant/wpa_supplicant.conf
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=ES

network={
    ssid=\"$ssid\"
    psk=\"$psk\"
}
EOF

echo "✅ Red guardada. Reiniciando Wi-Fi..."
systemctl stop hostapd
systemctl stop dnsmasq
wpa_cli -i wlan0 reconfigure
sleep 5
echo "💡 Puedes verificar la IP con: hostname -I"
