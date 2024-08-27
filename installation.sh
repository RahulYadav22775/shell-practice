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


VALIDATE(){
    if [ $1 -ne 0 ]
      then
          echo  -e " $R $2  failed $N " | tee -a >>$LOG_FILE
          exit 1
      else
          echo -e " $G $2  is success $N " | tee -a >>$LOG_FILE
      fi
}

#For loop used to install multiple packages
for package in $@
do
  dnf list installed $package &>>$LOG_FILE
  if [ $? -ne 0 ]
  then
      echo  -e " $Y $package is not installed ...install it $N " | tee -a >>$LOG_FILE

      dnf install $package -y &>>$LOG_FILE
      VALIDATE $? "installing $package"
  else 
      echo -e  " $G $package is already installed $N  " | tee -a >>$LOG_FILE
  fi
done

systemctl enable mysqld &>>$LOG_FILE
VALIDATE $? "enabling mysql-server"

systemctl start mysqld &>>$LOG_FILE
VALIDATE $? "starting mysql-server"

systemctl status mysqld &>>$LOG_FILE
VALIDATE $? "status of  mysql-server"

mysql -h 172.31.88.192 -uroot -pExpenseApp@1 -e 'show databases;' &>>$LOG_FILE
if [ $? -ne 0 ]
then 
    echo " $Y password is not set up $N " | tee -a >>$LOG_FILE
    mysql_secure_installation --set--root-pass ExpenseApp@1 &>>$LOG_FILE
    VALIDATE $? " password set up "
else
    echo " $G password is alraedy set up $N " | tee -a >>$LOG_FILE
fi




