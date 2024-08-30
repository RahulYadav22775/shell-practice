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

if [ -f $FILE ]
then 
    echo "$FILE exists you can continue " 
else 
    echo " file does not exist "
    exit 1
fi

echo " enter the word you want to count "

read WORD

COUNT=$(uniq -c $FILE) 
echo " $WORD COUNT IS :: $COUNT "

# wc -l $FILE

OCCURENCES=$(grep $WORD $FILE)

echo " $WORD occurences  in the file  ::::: $OCCURENCES "

REPEAT=$($OCCURENCES | wc -l)
echo " number of times $WORD repeated :: $REPEAT "
 


