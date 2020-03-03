#!/bin/bash

read -p "Enter DHCP configuration directory Path : " path                                        # Get input from user  

ip_last_digit_scan=$(cat $path/* | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |cut -c11- | uniq) # Scan ip from file & fetch last digits

echo "$ip_last_digit_scan" > scan_result.txt                                                     # Stored Scan result in file

sort -t"," -k1n,1 scan_result.txt > ascending_order_list.txt                                     # Arranged scan digits in ascending order
 
awk 'NR != $1 {                                                                                  
 for (i = prev + 1; i < $1; i++) {
    print "192.*.*."i
  }
}
{
  prev = $1
}' ascending_order_list.txt && rm ascending_order_list.txt scan_result.txt             # If netmask changed so need to change in 'print "new netmask"i                       
