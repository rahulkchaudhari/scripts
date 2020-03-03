#!/bin/bash

read -p "Enter IP: " ip
read -p "Passwd: " pass
read -p "Key Owner: " name
user='test'
while true; do
read -p "Do Want Add or Remove key "$'\n''1)add'$'\n''2)remove'$'\n' ar
    case $ar in
        [Aa]* ) read -p "Enter Key: " 'key' && sshpass -p "$pass" ssh  "$user"@"$ip" "  echo '###'$name$'\n' $key >> ~/.ssh/authorized_keys" &&  break;;
           [Rr]* ) read -p "Enter Key String: " key && sshpass -p "$pass" ssh  "$user"@"$ip"  "sed -i "/$name/d" ~/.ssh/authorized_keys && sed -i "/$key/d" ~/.ssh/authorized_keys" && exit;;
             * ) echo "Please type add or remove.";;
   esac
done

