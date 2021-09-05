#!/bin/bash

which ufw

ufw status

ufw default deny incoming

ufw default allow outgoing

echo "y" | ufw enable

# ufw allow 22
ufw allow ssh

# ufw allow mysql
ufw allow from 172.28.1.101 to any port 3306

ufw allow from 172.28.1.101 to any port 6379

ufw status numbered

#ufw delete [rule number]




