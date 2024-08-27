#!/bin/bash

USERID=$(id -u)

R=$"\e[31m"
G=$"\e[32m"
Y=$"\e[33m"
N=$"\e[0m"


if [ $USERID -ne 0 ]
then 
   echo " $R You are not a root user $N "
   exit 1
fi

# VALIDATE() {
#     if [ $1 -ne 0 ]
#     then
#         echo " $R $2 installation failed $N "
#     else
#         echo " $G $2 is installed $N "
#     fi
# }

# dnf list installed mysql

# if [ $? -ne 0 ]
# then 
#     echo " $Y mysql is not installed...instsllig $N "

#     dnf install mysql

#      VALIDATE $? "mysql"
# else
#     echo " $Y mysql is alraedy installed $N "
# fi

for i in $@
do 
  dnf list installed $i

  if [ $? -ne 0]
  then
      echo " $Y $i is not installed..INSTALLING  $N "
    
      dnf install $i -y

      if [ $? -ne 0 ]
      then 
          echo "  $R $i installation failed $N "
      else 
          echo " $G $i installation is success $N "
      fi

   else
      echo " $Y $i is already installed $N "
   fi
done
   
 
