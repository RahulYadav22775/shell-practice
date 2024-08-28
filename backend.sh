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



dnf module list nodejs &>>$LOG_FILE
VALIDATE $? " nodejs versions list "

dnf module disable nodejs -y &>>$LOG_FILE
VALIDATE $? " nodejs disable is "

dnf module enable nodejs:20 -y &>>$LOG_FILE
VALIDATE $? "nodejs:20 enable "

dnf install nodejs -y &>>$LOG_FILE
VALIDATE $? " nodejs installation "


useradd expense &>>$LOG_FILE
VALIDATE $? "useradd"

mkdir -p /app 

cd /

curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip &>>$LOG_FILE
VALIDATE $? " download "

cd /app
VALIDATE $? "change directory" 

unzip /tmp/backend.zip

npm install  &>>$LOG_FILE
VALIDATE $? " dependencies installation "

cp  /home/ec2-user/repos/shell-practice/backend.service /etc/systemd/system/backend.service &>>$LOG_FILE
VALIDATE $? "copying service file "

systemctl daemon-reload &>>$LOG_FILE

systemctl enable backend  &>>$LOG_FILE
VALIDATE $? "backend  service enable "

systemctl start backend &>>$LOG_FILE
VALIDATE $? " backend service starting "

systemctl status backend &>>$LOG_FILE
VALIDATE $? " bacakend service status "

mysql -h <ip address of  database> -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>$LOG_FILE
VALIDATE $? " adding of databases "

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]
then 
    echo -e " mysql is not $Y installed...installing $N " |tee -a >>$LOG_FILE
     dnf install mysql -y &>>$LOG_FILE
     VALIDATE $? " mysql installation "
else
    echo -e " mysql is already $G installed $N " |tee -a >>$LOG_FILE
fi

show databases;

