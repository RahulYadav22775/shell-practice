#!/bin/bash
 
 USERID=$(id -u)

 R=$"\e[31m"
 G=$"\e[32m"
 N=$"\e[0m"
 B=$"\e[33m"


 if [ $USERID -ne 0 ]
 then 
 echo -e " $R you are not a root user to execute the script $N "
 exit 1
 fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo " mysql is not installed "
else
    echo  -e" $B mysql is already installed $N "
    exit 1
fi    

dnf install mysql -y

if [ $? -ne 0 ]
then
    echo "mysql istallation is not success "
    exit 1
else
    echo  -e " $G mysql is successfully installed $N "
fi    
