#!/bin/bash


SOURCE_DIR=$1

echo "script executed at :: $(date) "

USAGE() {
    echo " USAGE :: you need to provide arguments "  
    exit 1  
}

if [ $# -eq 0 ]
then 
    USAGE
    
fi 

 if [ -d $SOURCE_DIR ] 
 then
     echo " $SOURCE_DIR exists .you can continue "
 else 
     echo " $SOURCE_DIR  dosent exists "
     exit 1
 fi
cd /home/ec2-user/logs
FILES=$(find $SOURCE_DIR -name "*.log" )
 
 LIST=$( ls -ltr)

#  for i in $FILES
#  do
#     echo "print  files : $i "
#  done

while IFS= read -r file
do 
   echo "print files :: $file "
   rm -rf $file
done <<<$FILES