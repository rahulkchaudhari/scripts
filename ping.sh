ping -c 2 192.168.1.165 | awk '/100%/ {print "no"}' |read Pingable
if [ "$Pingable" != "no" ]
then
print $ip  >>pingresults.txt
else
print $ip >>pingresultsf.txt
fi
