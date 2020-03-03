#!/bin/bash

username=administrator


ip_find="ip route get 8.8.8.8 | tr -s ' '| cut -d ' ' -f 7"
dhcp_find="grep dhcp-server-identifier /var/lib/dhcp/dhclient.leases"
file_find="find /etc/NetworkManager/system-connections/ -type f -name "*connection*""
replace_address="sudo sed -i "/address1/d""
replace_dns="sudo sed -i 's/8.8.8.8/ /g'"
replace_method="sudo sed -i 's/method=manual/method=auto/g'"
reboot="sudo reboot"
network_type="sudo sed -i '/ipv4/,+4 d'" 
add_manual_conf="$'\n''dns=8.8.8.8;'$'\n''dns-search='$'\n''method=manual'| sudo tee -a"
#host_ping_result="sudo nmcli connection reload && hostname && ping -c 2 google.com && $ip_find  && $dhcp_find"


read -p "Do Want Configure Systems on DHCP Or Static IP"$'\n''1)dhcp'$'\n''2)static'$'\n' ar

if [ "$ar" == "dhcp" ] 
then 
	while IFS=',' read -r f1 f2  f3 f4 f5 f6
	do

#	conf_file="$(sshpass  ssh "$username"@"$f2"  "$file_find" </dev/null)" && sshpass  ssh  "$username"@"$f2"  "$replace_address '$conf_file'  && $replace_dns '$conf_file' &&  $replace_method '$conf_file' && $host_ping_result && $reboot"   </dev/null ;

	conf_file="$(sshpass  ssh "$username"@"$f2"  "$file_find" </dev/null)" && result="$(sshpass  ssh "$username"@"$f2" "$ip_find"  </dev/null)" && echo -e 'IP ='"$result"$'\n'"$conf_file"$'\n'$'\n'$'\n'  '[ipv4]'$'\n' 'dns= ;'$'\n' 'dns-search=' $'\n' 'method=auto'$'\n' '********************************************************************************************************************************' 


	done < issues.csv  #CSV file with 'IP address' details.

elif [ "$ar" == "static"  ] 
then
	while IFS=',' read -r f1 f2  f3 f4 f5 f6
	do
#	 conf_file="$(sshpass  ssh "$username"@"$f2" "$file_find" </dev/null)"  && result="$(sshpass  ssh "$username"@"$f2" "$ip_find"  </dev/null)" && sshpass  ssh  "$username"@"$f2"  "$network_type '$conf_file' && echo -e '[ipv4]'$'\n''address1='"$result"'/24,192.*.*.*'$add_manual_conf '$conf_file' && $host_ping_result && $reboot " </dev/null ;
	
	conf_file="$(sshpass  ssh "$username"@"$f2"  "$file_find" </dev/null)" && result="$(sshpass  ssh "$username"@"$f2" "$ip_find"  </dev/null)" && echo -e 'IP ='"$result"$'\n'"$conf_file"$'\n' $'\n'$'\n' '[ipv4]'$'\n' 'address1='"$result"'/24,192.*.*.*'$'\n' 'dns=8.8.8.8 ;'$'\n' 'dns-search=' $'\n' 'method=manual'$'\n' '********************************************************************************************************************************'

	done < issues.csv  #CSV file with 'IP address' details.

 else
	echo 'Invalid Input'

fi


