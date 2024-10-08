#!/bin/bash

USERID=$(id -u)

R=$"\e[31m"
G=$"\e[32m"
Y=$"\e[33m"
N=$"\e[0m"


if [ $USERID -ne 0 ]
then 
   echo  -e " $R You are not a root user $N "
   exit 1
fi

VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo -e " $R $2 installation failed $N "
    else
        echo -e " $G $2 is installed $N "
    fi
}

for i in $@
do 
  dnf list installed $i

  if [ $? -ne 0 ]
  then
      echo -e  " $Y $i is not installed..INSTALLING  $N "
    
      dnf install $i -y

      VALIDATE $? $i

   else
      echo -e " $Y $i is already installed $N "
   fi
done
   
 
