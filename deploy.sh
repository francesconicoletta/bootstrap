#!/bin/sh

stty -echo
printf "Password: "
read PASSWORD
stty echo
printf "\n"

echo $PASSWORD | sudo -S apt update
echo $PASSWORD | sudo -S apt install ansible git

ansible-playbook -K dotfiles.yml

