# MACChanger AutoLoop

Rotate your MAC address automatically on Kali Linux to enhance operational stealth during assessments or research.

## 📜 About

**MACChanger-AutoLoop** automatically changes your network interface's MAC address every few minutes.  
It also safely restores your original MAC address if you terminate the session (CTRL+C).

Designed for:

- Red Team operations
- Pentesting
- Privacy-focused research sessions

## ⚙️ Usage

1. Download the script:

```bash
git clone https://github.com/echohollow/macchanger-autoloop.git
cd macchanger-autoloop
chmod +x mac_changer.sh
.\mac_changer.sh
