#!/bin/bash

sudo_pass="****"

vm1="172.28.**.**"
vm2="172.28.**.**"

gnome-terminal --tab -- bash -c "echo $sudo_pass | sudo -S openvpn --config /path/to/vpn/TCP4-11955.ovpn; exec bash"
sleep 5
gnome-terminal --tab -- bash -c "ssh root@${vm1}; exec bash"
gnome-terminal --tab -- bash -c "ssh root@${vm2}; exec bash"
