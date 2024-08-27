#!/bin/bash

USERID=$(id -u)

R=$"\e[31m"
G=$"\e[32m"
Y=$"\e[33m"
N=$"\e[0m"

VALIDATE() {

    if [ $1 -ne 0 ]
    then 
        echo -e " $R $2 is not installed $N " 
    else 
        echo -e " $G $2 is installed $N "
    fi

}

CHECKROOT() {

    if [ $USERID -ne 0 ]
    then 
        echo  -e " $R you are not root user to execute this script $N "
        exit 1
    fi
}


CHECKROOT

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo  -e " $Y mysql is not installed ..installing $N "

    dnf install mysql -y

    VALIDATE $? "mysql"
else 
    echo -e " $G mysql is installed $N "
    
fi

# dnf install mysql -y

# if [ $? -ne 0 ]
# then 
#     echo -e " $R mysql is not installed $N " 
# else 
#     echo -e " $G mysql is installed $N "
# fi
 CHECKROOT


 dnf list installed nginx

if [ $? -ne 0 ]
then 
    echo  -e " $Y nginx is not installed ..installing $N "

    dnf install mysql -y

    VALIDATE() $? "nginx"
else 
    echo -e " $G nginx is installed $N "
    exit 1
fi
