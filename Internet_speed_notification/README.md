## **Steps For Run Script**

1)**Copy Below Mentioned Files In Your System**

 * internet_status.sh(Shell Script)

2) **Change Permission Of File For Execute**

chmod +x internet_status.sh

3)**Install  Packages & configure**
 * sudo apt-get install gnupg1 apt-transport-https dirmngr && export INSTALL_KEY=379CE192D401AB61 && export DEB_DISTRO=$(lsb_release -sc) && sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $INSTALL_KEY && echo "deb https://ookla.bintray.com/debian ${DEB_DISTRO} main" | sudo tee  /etc/apt/sources.list.d/speedtest.list && sudo apt-get update && sudo apt-get install speedtest	
 

**create .muttrc file in  user account & put**
```
set from = system name with user..
set realname = system real name..
set smtp_url =  "smtp://<gmail-id>@smtp.gmail.com:587/" (ex. "smtp://emailid@gmail.com@smtp.gmail.com:587/")
set smtp_pass = "<email_id-password>"  
```
[ref1](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-postfix-as-a-send-only-smtp-server-on-ubuntu-16-04)

[ref2](http://xmodulo.com/send-email-notifications-gmail-smtp-server-linux.html)

[ref3](https://www.howtogeek.com/51819/how-to-setup-email-alerts-on-linux-using-gmail/)

[ref4](https://www.speedtest.net/apps/cli)

4) **Set Email Id**

Set Your Email Id  In  script

5) **Save File**

6) **Run Script**

internet_status.sh

7)  **To Scheduled Script In Crontab**


First open crontab using- crontab -e

then set parameter:

```
*/1 * * * * /bin/bash /../.../internet_status.sh (Set path of your script as per your system)
In above lines */1 are use for every minute , * use crontab means any ,Crontab value is minute , hour , day of month , month , day of week.
```
* To check crontab list using : crontab -l

* To remove all from crontab : crontab -r
