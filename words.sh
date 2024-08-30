#!/bin/bash

# USAGE() {
#      echo " you are not a root user to execute this script "
#      exit 1
# }

# if [ $# -eq 0 ]
# then 
#     USAGE
# fi

echo " enter the file name : "

read FILE

echo " enter the word you want to count "

read WORD

# if [ -f $FILE ]
# then 
#     echo "word  in the file "
#     grep $WORD $FILE
# else 
#     echo " file does not exist "
#     exit 1
# fi

if [ -f $FILE ]
then 
    uniq -c $FILE
else 
    echo " file does not exist "
    exit 1
fi