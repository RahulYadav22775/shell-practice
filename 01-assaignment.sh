#!/bin/bash

FILE_NAME=$1

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


USAGE() {

      echo "USAGE::: $FILE_NAME <file-name> <search_word> "
      exit 1
}

if [ $# -ne 1 ]
then
    USAGE
fi

if [ ! -f $FILE_NAME ]
then 
    echo " the file $FILE_NAME does not exist "
    exit 1
else
    echo "the file  $FILE_NAME exist"
fi

awk '{for (i=1; i<=NF; i++) words[$i]++ } END { for (word in words) print word, words[word]}' $FILE_NAME | 
sort -k2,2nr -k1,1 | awk '$2 > 1 { print }'