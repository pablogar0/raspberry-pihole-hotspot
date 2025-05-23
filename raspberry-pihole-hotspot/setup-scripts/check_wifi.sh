#!/bin/bash

LOG="/var/log/hotspot-fallback.log"
IP=$(hostname -I | awk '{print $1}')

if ! iw wlan0 link | grep -q "Connected"; then
  echo "$(date): ❌ Wi-Fi no conectada. Activando hotspot..." | tee -a $LOG
  ip link set wlan0 up
  systemctl start hostapd
  systemctl start dnsmasq
  echo "🔊 Hotspot activo en IP: 192.168.4.1"
else
  echo "$(date): ✅ Wi-Fi conectada."
  echo "🌐 IP actual: $IP" | tee -a $LOG
  echo "🔗 Accede a Pi-hole en: http://$IP/admin"
  qrencode -t ANSIUTF8 "http://$IP/admin"
fi
