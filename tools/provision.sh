#!/bin/bash

sed -i 's/^#* *\(PermitRootLogin\)\(.*\)$/\1 yes/' /etc/ssh/sshd_config
sed -i 's/^#* *\(PasswordAuthentication\)\(.*\)$/\1 yes/' /etc/ssh/sshd_config
systemctl restart sshd.service
echo -e "vagrant\nvagrant" | (passwd vagrant)
echo -e "root\nroot" | (passwd root)
sudo apt update -y
sudo apt install wget ansible sshpass git -y
git clone https://github.com/lsiksous/manul.git
chown -R vagrant:vagrant manul
