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

if [ $USERID -ne 0 ]
then 
    echo  -e " you need $R root access permission $N to execute this script " |tee -a >>$LOG_FILE
    exit 1
fi

mkdir -p $LOG_FOLDER

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]
then 
    echo -e " Nginx is not $Y installed...installing $N " |tee -a >>$LOG_FILE
     dnf install nginx -y &>>$LOG_FILE
     VALIDATE $? " nginx installation "
else
    echo -e " nginx is already $G installed $N " |tee -a >>$LOG_FILE
fi

systemctl enable nginx &>>$LOG_FILE
VALIDATE $? " nginx enable "

systemctl start nginx &>>$LOG_FILE
VALIDATE $? " startig of "

systemctl status nginx &>>$LOG_FILE
VALIDATE $? " nginx status "

rm -rf /usr/share/nginx/html/* &>>$LOG_FILE
VALIDATE $? " all files removal "

cd /

curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip &>>$LOG_FILE
VALIDATE $? " download "

cd /usr/share/nginx/html &>>$LOG_FILE
VALIDATE $? " changing directory "

unzip unzip /tmp/frontend.zip &>>$LOG_FILE

cp  /home/ec2-user/repos/shell-practice/frontend.conf /etc/nginx/default.d/frontend.conf &>>$LOG_FILE
VALIDATE $? " copying files "

systemctl restart nginx &>>$LOG_FILE