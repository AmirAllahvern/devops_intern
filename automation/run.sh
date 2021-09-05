#!/bin/bash

sudo_pass="amir4141"

vm1="172.28.1.101"
vm2="172.28.1.102"

gnome-terminal --tab -- bash -c "echo $sudo_pass | sudo -S openvpn --config /home/amir/Desktop/vpn/TCP4-11955.ovpn; exec bash"
sleep 5
gnome-terminal --tab -- bash -c "ssh root@${vm1}; exec bash"
gnome-terminal --tab -- bash -c "ssh root@${vm2}; exec bash"
