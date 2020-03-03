#!/bin/bash
read -p "Enter Directory Path : " directory
read -p "How Many Days Old Files Do Want To Search : " days
log_path=/home/username/ 
dir_path=$directory
days=+$days

#find $dir_path -type f -mtime $days -printf "%Tb %Td %TY %p\n" 

old_files=$(find $dir_path -mtime $days -printf "%Tb %Td, %Ty %p\n") 

if [ "${old_files}" = '' ]; then
  echo "No files older than ${days} days old to be removed" 
else
   echo "$old_files" 
   #-printf "%Tb %Td, %Ty %p\n" 
while true; do
    read -p "Do Want To Remove This File?"$'\n''1)Yes'$'\n''2)NO'$'\n' yn
    case $yn in
        [Yy]* ) echo '---------- Delete files older than ' $days 'from directory ' $dir_path 'on' $(date) ' ----------' >> $log_path/log.txt && find $dir_path -mtime $days -printf "%Tb %Td %TY %p\n" >>  $log_path/log.txt && find $dir_path -mtime $days -delete; break;;
       # [Nn]* ) exit;;
       # * ) echo "Please answer yes or no.";;
         [Nn]* ) echo 'No files deleted' >> $log_path/log.txt; exit;;
             * ) echo "Please type yes or no.";;
   esac
done
fi
