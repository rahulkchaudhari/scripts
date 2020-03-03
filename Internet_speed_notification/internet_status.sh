#!/bin/bash

speedtest >> /home/rahulc/scripts/Internet_speed_notification/log.txt

result=$(cat  /home/rahulc/scripts/Internet_speed_notification/log.txt | grep Download | tr -s ' ' | cut -d ' ' -f 3)

log=$(cat /home/rahulc/scripts/Internet_speed_notification/log.txt)

email_subject='Incident internet speed slow - '$(date +"%B %d,%Y")

email_body='Incident Occurred'$(date +" At:%I:%M %p")$'\n''Incident Details:'$'\n'"$log"

if (( $(echo "$result <= 50" |bc -l) )); 
then 
 echo -e "${email_body}"| mutt -s "$email_subject" emailid  && rm /home/rahulc/scripts/Internet_speed_notification/log.txt 	
fi  
rm /home/rahulc/scripts/Internet_speed_notification/log.txt
