#!/bin/bash

# MACCHANGER-AUTOLOOP: Rotate MAC every X minutes, auto-restore on CTRL+C

iface="eth0"
interval_minutes=15  # Change this for your rotation period

original_mac=$(cat /sys/class/net/$iface/address)

function cleanup() {
  echo -e "\n[!] Reverting to original MAC: $original_mac"
  sudo ip link set $iface down
  sudo macchanger -m $original_mac $iface | grep "Permanent MAC"
  sudo ip link set $iface up
  echo "[✓] MAC restored. Stealth session terminated."
  exit 0
}

trap cleanup INT

echo "[+] MAC Auto-Rotation Started on $iface"
echo "[+] Original MAC: $original_mac"
echo "[+] Rotating every $interval_minutes minutes"

while true; do
  sudo ip link set $iface down
  sudo macchanger -r $iface | grep "New MAC"
  sudo ip link set $iface up

  for ((i=interval_minutes*60; i>0; i--)); do
    printf "\r[*] Next MAC rotation in %02d:%02d" $((i/60)) $((i%60))
    sleep 1
  done
done
