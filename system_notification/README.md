## **Steps For Run Script**

1)**Copy Below Mentioned Files In Your System**

 *NetworkComponentCheck.sh(Shell Script)

 *network_component_template.csv(Input File)

2) **Change Permission Of File For Execute**

chmod +x NetworkComponentCheck.sh

3)**Install  Packages & configure**
 *sudo apt-get install mutt
 *sudo apt-get install mailutils	
 *sudo apt-get install ssmtp

**create .muttrc file in  user account & put**

*set from = system name with user..
*set realname = system real name..
*set smtp_url =  "smtp://<gmail-id>@smtp.gmail.com:587/" (ex. "smtp://emailid.com@smtp.gmail.com:587/")
*set smtp_pass = "<email_id-password>"  

ref:(https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-postfix-as-a-send-only-smtp-server-on-ubuntu-16-04)
    (http://xmodulo.com/send-email-notifications-gmail-smtp-server-linux.html)
    (https://www.howtogeek.com/51819/how-to-setup-email-alerts-on-linux-using-gmail/)


4) **Make Changes IN Script** .

set path in report_path
report_path=/home/user_name../directory_name../

5) **Set Email Id**

Set Your Email Id  In  script
set mail body 
mail_body='write here'$'\n'

6) **Save File**

7) **Run Script**

./NetworkComponentCheck.sh

8)  **To Scheduled Script In Crontab**

First open crontab using- crontab -e
then set parameter:
*/1 * * * * /bin/bash /../.../NetworkComponentCheck.sh (Set path of your script as per your system)

In above lines */1 are use for every minute , * use crontab means any ,Crontab value is minute , hour , day of month , month , day of week.

*To check crontab list using : crontab -l
*To remove all from crontab : crontab -r


if you want to use  script for redmine purpose  follow instruction 

1)comment *component_status* and *unreachable_component* variable which used in if else condition And uncomment *redmine* variable .

2) **comment following variable also** 
 
*report_name
*report_path
*component_header
*email_body

**also comment following two syntax**
 
echo -e "${component_status}" > $report_path$report_name.csv 
echo -e "${email_body}" | mutt -s "$email_subject" Write Email Here..  -a $report_path$report_name.csv

3) **uncomment following variable**

*component_header_redmine
*email_body_redmine

**also uncomment following two syntax**

echo -e "${email_body_redmine}"| mutt -s "$email_subject" Email Here..
