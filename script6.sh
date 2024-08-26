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
    echo  -e " $B mysql is already installed $N "
      
fi    

dnf install mysql -y

if [ $? -ne 0 ]
then
    echo "mysql istallation is not success "
    
else
    echo  -e " $G mysql is successfully installed $N "
fi    

dnf list installed git 

if [ $? -ne 0 ] 
then
    echo " git is not installed "
else 
    echo  -e " $G git is already installed $N "
fi

dnf install git -y

if [ $? -ne 0 ]
then
    echo -e " $R git installation is failure $N "
else 
    echo -e " $G git installation is success $N "
fi
