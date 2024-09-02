#!/bin/bash
FILE_NAME=$1

USAGE() {
    echo " USAGE:: $0 <FILE-NAME>"
    exit 1
}

if [ $# -eq 0 ]
then 
    USAGE
fi

COUNT=$(cat $FILE_NAME | wc -w)
echo " word count ::: $COUNT " 

for i in {1..$COUNT}
do
  word=$(cat $FILE_NAME | awk -F " " '{print $i}')
  echo "word is ::: $word"
#   WORD_COUNT=$(cat $FILE_NAME | grep "$word" | wc -l)
#   echo " word count of $word is :::: $WORD_COUNT "

#   if [ $WORD_COUNT -ne 0 ]
#   then
#       echo "the count of the word $word in the file $FILE_NAME is ::: $WORD_COUNT "
#   fi

done