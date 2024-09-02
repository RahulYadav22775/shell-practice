#!/bin/bash
FILE_NAME=$1
WORD=$2

USAGE() {
    echo " USAGE:: $0 <FILE-NAME>"
    exit 1
}

if [ $# -eq 0 ]
then 
    USAGE
fi

COUNT=$(cat $FILE_NAME | wc -w) 

wordcount=$(cat $FILE_NAME | uniq -c)
echo "each word count is :::: $wordcount "
# for i in {1..$COUNT}
# do
  
#   WORD_COUNT=$(cat $FILE_NAME | grep -i $WORD | wc -l)
#   echo " word count of $WORD is :::: $WORD_COUNT "

# #   if [ $WORD_COUNT -ne 0 ]
# #   then
# #       echo "the count of the word $word in the file $FILE_NAME is ::: $WORD_COUNT "
# #   fi

# done