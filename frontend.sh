#!/bin/bash

LOG_FOLDER="/var/log/nginx/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE=$LOG_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log
 
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

VALIDATE() {
     if [ $1 -ne 0 ]
    then 
        echo  -e "$2..... is $R failed $N " | tee -a >>$LOG_FILE
        exit 1
    else
        echo -e "$2..... is $G success $N " | tee -a >>$LOG_FILE
    fi
}

mkdir -p $LOG_FOLDER

if [ $USERID -ne 0 ]
then 
    echo  -e " you need $R root access permission $N to execute this script " |tee -a >>$LOG_FILE
    exit 1
fi

dnf list installed nginx
if [ $? -ne 0 ]
then 
    echo -e ""
