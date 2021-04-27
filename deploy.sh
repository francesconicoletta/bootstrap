#!/bin/sh

stty -echo
printf "Password: "
read -r PASSWORD
stty echo
printf "\n"

echo "$PASSWORD" | sudo -S apt update
echo "$PASSWORD" | sudo -S apt install -y ansible git

dir=$(cd -- "$(dirname -- "$0")" && pwd)
cd "$dir" || exit

ansible-playbook -K -C dotfiles.yml

