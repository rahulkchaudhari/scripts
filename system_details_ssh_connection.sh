#!/bin/bash   
username=test
passwd=****** # Put paasword 

#host name
host="hostname"
#os name
os="head -n1 /etc/issue"
#architecture
arch=arch
#processor info
processor="cat /proc/cpuinfo | grep 'model name' | cut -c14- | uniq"
#ram size
ram="free -h | grep ^Mem | tr -s ' ' | cut -d ' ' -f 2"
#harddrive size
harddrive="dmesg | grep 'logical blocks' | cut -c69-"
#mac address
mac="ip link show | grep ether | tr -s ' ' | cut -d ' ' -f 3"
#system users name
users="cd /home && ls|xargs"
#media access permission
access="getfacl /media" 
#Bluetooth Access
bluetooth="service bluetooth status | grep active"

execute="$host && $os && $arch && $ram && $harddrive && $users && $access && $bluetooth"  # variable as per your requirement you can add or removed.  

 while IFS=',' read -r f1 f2 f3 f4 f5 f6 f7 f8 f9 f10  # change as per csv file colume count  
do
    result="$(sshpass -p "$passwd" ssh  "$username"@"$f10" "$execute" </dev/null)"  # replace $f10 with your file ip colume number. 

echo -e $f1,$f2,$f3,$f4,$f5,$f6,$f7,$f8,$f9,$f10,\""$result"\\n\" >> result.csv #output file.

done < input.csv  #CSV file with 'IP address' details.

