#!/bin/bash

echo "=============================="
echo " LINUX SECURITY AUDIT REPORT "
echo "=============================="
echo

echo "===== SYSTEM INFO ====="
hostnamectl
echo

echo "===== OPEN PORTS ====="
sudo ss -tulnp
echo

echo "===== FIREWALL STATUS ====="
sudo ufw status verbose
echo

echo "===== SSH HARDENING CHECK ====="
sudo grep -E 'PermitRootLogin|PasswordAuthentication|PubkeyAuthentication' /etc/ssh/sshd_config
echo

echo "===== SUDO USERS ====="
getent group sudo
echo

echo "===== ROOT ACCOUNT STATUS ====="
sudo passwd -S root
echo

echo "===== RUNNING SERVICES ====="
systemctl --type=service --state=running --no-pager
echo

echo "===== WORLD WRITABLE FILE SCAN (TOP 20) ====="
sudo find / -type f -perm -0002 2>/dev/null | head -20
echo

echo "===== AUDIT COMPLETE ====="
