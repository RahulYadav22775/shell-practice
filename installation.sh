#!/bin/bash

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"

mkdir -p $LOG_FOLDER


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

#Checks arguments provided or not
if [ $# -eq 0 ]
then 
   echo  -e "  USAGE : $Y please enter arguments/inputs to execute this script $N " | tee -a >>$LOG_FILE
   exit 1
fi

#checks whether root user or not
if [ $USERID -ne 0 ]
then 
    echo -e  " $R you need to have root access to execute this script $N " | tee -a >>$LOG_FILE
    exit 1
fi

#For loop used to install multiple packages
for package in $@
do
  dnf list installed $package &>>$LOG_FILE
  if [ $? -ne 0 ]
  then
      echo  -e " $Y $package is not installed ...install it $N " | tee -a >>$LOG_FILE

      dnf install $package -y &>>$LOG_FILE
      if [ $? -ne 0 ]
      then
          echo  -e " $R $package installation failed $N " | tee -a >>$LOG_FILE
      else
          echo -e " $G $package installation is success $N " | tee -a >>$LOG_FILE
      fi
  else 
      echo -e  " $G $package is already installed $N  " | tee -a >>$LOG_FILE
  fi
done


