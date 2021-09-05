#!/bin/bash

read -p "Enter the first static IP: " static_ip1
read -p "Enter the second static IP: " static_ip2 

cat > /etc/netplan/00-installer-config.yaml <<EOF
network:
  ethernets:
    ens160:
      addresses:
      - 172.28.1.101/16
      gateway4: 172.28.1.1
      nameservers:
        addresses:[$static_ip1,$static_ip2]
  version: 2
EOF

sudo netplan apply
systemd-resolve --status | grep 'DNS Servers' -A2

