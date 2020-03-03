#!/bin/bash


while IFS=',' read -r f1 f2 f3 f4 

do
    ping -c 10 "$f4"
 if [ $? -eq 0 ] ; then
    echo "${f4}"'Working'$'\n'
else
 result=""$result"  "${f2}"  "${f3}"  "${f4}"    Unable to ping"$'\n' 

 fi
done < /home/rahulc/scripts/system_notification/Device_List.csv

email_subject='Incident Alert Notification - '$(date +"%B %d,%Y")

email_body='Incident Occurred'$(date +" At:%I:%M %p")$'\n''Incident Details:'$'\n'"$result"

if [ ! -z "$result" ]; then
 echo -e "${email_body}"| mutt -s "$email_subject" emailid 
fi


