#!/bin/bash

USERID=$(id -u)

R=$"\e[31m"
G=$"\e[32m"
Y=$"\e[33m"
N=$"\e[0m"

if [ $USERID -ne 0 ]
then 
    echo " $R you are not root user to execute this script $N "
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo " $Y mysql is not installed $N "
else 
    echo " $G mysql is installed $N "
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]
then 
    echo " $R mysql is not installed $N " 
else 
    echo " $G mysql is installed $N "
fi


 