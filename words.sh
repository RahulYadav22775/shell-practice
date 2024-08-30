#!/bin/bash

echo " enter the file name : "

read FILE

echo " enter the word you want to count "

read WORD

if [ -f $FILE ]
then 
    echo "word  in the file "
    grep $WORD $FILE
else 
    echo " file does not exist "
    exit 1
fi