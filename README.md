# Auto-Deauth-on-specific-mac

A Bash-based automated Wi-Fi deauthentication attack tool for ethical hacking and wireless penetration testing.

## 📜 Description

**Auto Deauth Script** is a simple yet powerful Bash script that performs a targeted Wi-Fi deauthentication attack using `airmon-ng`, `aireplay-ng`, and `iwconfig`. It’s designed for **educational** and **authorized security testing** scenarios, where you want to disconnect a specific device from a network temporarily.

> ⚠️ **For educational use only. Do NOT use this on networks or devices without explicit permission. Unauthorized use is illegal.**

---

## 🔧 Features

- 🔐 **Root check** to ensure proper permissions  
- 📡 **Monitor mode activation** on selected Wi-Fi interface  
- 📶 **Channel locking** for stable injection  
- 🎯 **Targeted attack** using customizable BSSID and victim MAC  
- ♻️ **Infinite deauthentication loop** using `aireplay-ng`  
- 🧼 **Auto-cleanup** on Ctrl+C to restore system state

---

## ⚙️ Configuration

Edit the script to set your target parameters:

```bash
WIFI_INTERFACE="wlan0"  # Wireless adapter name
TARGET_BSSID="C8:3A:35:4B:71:F1"  # Access Point MAC
TARGET_CHANNEL="1"  # Channel of the AP
VICTIM_MAC="ee:7b:4a:4c:44:d8"  # Victim device MAC
````
## ▶️ Usage

Run the script **as root**:

```bash
sudo ./hassaan-script.sh
```
When prompted, the script will:

1. Enable monitor mode
2. Lock to target channel
3. Launch continuous deauthentication attack
4. Clean up when you press `Ctrl+C`

---

## 🛑 Disclaimer

This script is for **educational and ethical hacking** purposes **only**. Misusing it to disrupt unauthorized networks is **illegal** and could result in criminal charges.

---

## 📁 Dependencies

Make sure the following tools are installed:

* `aircrack-ng`
* `iwconfig`
* `bash` (standard on Linux)

Install on Debian-based systems with:

```bash
sudo apt update && sudo apt install aircrack-ng wireless-tools
```

---

## 👨‍💻 Author

**Hassaan Ahmed**
Cybersecurity Student | Ethical Hacking Enthusiast
📍 Pakistan


