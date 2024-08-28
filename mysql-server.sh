#!/bin/bash

LOG_FOLDER="/var/log/shell-script"
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


dnf list installed mysql-server &>>$LOG_FILE
if [ $? -ne 0 ]
then 
    echo  -e " mysql-server is $Y not installed....installing $N " |tee -a >>$LOG_FILE
    dnf install mysql-server -y
    VALIDATE $? "mysql server installation "
else 
    echo -e  " mysql server is already $G installed successfully $N "  |tee -a >>$LOG_FILE

fi

systemctl start mysqld &>>$LOG_FILE
VALIDATE $? "mysql server starting "

systemctl enable mysqld &>>$LOG_FILE
VALIDATE $? " mysql server enable "

systemctl status mysqld &>>$LOG_FILE
VALIDATE $? "mysql server status "


dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]
then 
    echo  -e " mysql is $R not installed....installing $N " |tee -a >>$LOG_FILE
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "mysql  installation "
else 
    echo -e  " mysql  is already $G installed successfully $N " |tee -a >>$LOG_FILE

fi

mysql -h  172.31.86.130 -uroot -pExpenseAPP@1 -e "show databases;" &>>$LOG_FILE
if [ $? -ne 0 ]
then
   echo " Password is not $Y not created...creating $N " |tee -a >>$LOG_FILE
   mysql_secure_installation --set--root-pass ExpenseApp@1 &>>$LOG_FILE
   VALIDATE $? " password set up "
else
    echo " password is already setup $G successfully $N " |tee -a >>$LOG_FILE
fi


    


