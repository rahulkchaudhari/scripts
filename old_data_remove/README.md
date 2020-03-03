1) **Copy file_remove.sh File On Your System** .

2) **Set Permission**

chmod +X file_remove.sh

3)**Make changes in script** 

*Set Path Of Particular Directory

* Set Log File Path .

* Set How many Days Old You Want TO Search .

4)**Run Script ./file_remove.sh**

5)**Select Option By Press 1 0r 2 & Press Enter For Continue.**
1=Yes
2=No
6)**check Log File** 

7) **To scheduled script in crontab**

First open crontab using- crontab -e
then set parameter:
*/1 * * * * /bin/bash /home/user_name../file_remove.sh (Set as per your system)

In above lines */1 are use for every minute , * use crontab means any ,Crontab value is minute , hour , day of month , month , day of week.

To check crontab list using : crontab -l
To remove all from crontab : crontab -r