#!/bin/bash
################################################################
# $Version:1.0.0.0 $
# $Author : Akshat Joshi IIPL144
# $Date :17 /01/2013
# $Phone :999-281-416 
###############################################################
Change_Password ()
{
echo -e " \033[32m Enter the user name you wish to change the password: \033[0m \t"
read User
echo -e " \033[32m Setting New password for $User: \033[0m \t"
passwd $User

}

Check_Disk_Space ()
{
echo -e " \033[32m Displaying Disk Space Status:  \033[0m \t"
df -h

}

Login_to_Host ()
{

SSH=/usr/bin/ssh
SSH_OPTS=" -t -t "
echo -e " \033[32m Enter the UserName of the Linux machine in which you want to do ssh:  \033[0m \t"
read UserName
echo -e " \033[32m Enter the IP of the Linux machine in which you want to do ssh:  \033[0m \t"
read Ip
echo -e " \033[32m Going to check the $Ip is Valid Machine:  \033[0m \t"
ping -c2 $Ip >> /dev/null
if [ $? = 0 ]
        then
            echo -e " \033[32m Going to Login in $Ip Machine:  \033[0m \t"
            $SSH $SSH_OPTS $UserName@$Ip
else
        echo -e " \033[32m $Ip is not pingable....Please check: \033[0m \t"
fi

}

Show_All_Service_Running ()
{
echo -e " \033[32m Displaying All running process in the Machine:  \033[0m \t"
ps -ef|less

}

Show_All_Open_Ports ()
{
echo -e " \033[32m Displaying All Open Ports Of The Machine:  \033[0m \t"
#nmap -p1-65535 127.0.0.1
netstat -lptu|less

}

Show_All_Java_Apps ()
{
echo -e " \033[32m Displaying All Java application which running On The Machine:  \033[0m \t"
ps -ef|grep java|grep -v grep

}


Kill_Application ()
{
echo -e " \033[32m Please Enter the PID of  application Which you want to kill:  \033[0m \t"
read pid
kill -9 $pid

}


while :
do

echo -e  "  \033[32m --------------------------------------- \033[0m"
    echo -e  " \033[32m           Main Menu \033[0m"
    echo -e  " \033[32m ---------------------------------------- \033[0m"
echo -e " \033[32m [1] Change_Password \033[0m"
echo -e " \033[32m [2] Check_Disk_Space \033[0m"
echo -e " \033[32m [3] Login_to_Host  \033[0m"
echo -e " \033[32m [4] Show_All_Service_Running  \033[0m"
echo -e " \033[32m [5] Show_All_Open_Ports  \033[0m"
echo -e " \033[32m [6] Show_All_Java_Apps  \033[0m"
echo -e " \033[32m [7] Kill_Application \033[0m"
echo -e " \033[32m [8] Exit \033[0m"
echo -e " \033[32m Enter your menu choice [1-8]: \033[0m \t"
read Option
clear
        case $Option in
                1)Change_Password;;
                2)Check_Disk_Space;;
                3)Login_to_Host;;
                4)Show_All_Service_Running;;
                5)Show_All_Open_Ports;;
                6)Show_All_Java_Apps;;
                7)Kill_Application;;
                8)exit;;
        esac
done

