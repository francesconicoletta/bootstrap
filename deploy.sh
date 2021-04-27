#!/bin/sh

stty -echo
printf "Password: "
read PASSWORD
stty echo
printf "\n"

echo $PASSWORD | sudo -S apt update
echo $PASSWORD | sudo -S apt install ansible git

dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
cd $dir

ansible-playbook -K dotfiles.yml

