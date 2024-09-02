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

for i in {1..$COUNT}
do
  word=$(cat $FILE_NAME | cut -d " " -f${i})
  WORD_COUNT=$(grep -o $word $FILE_NAME | wc -l)

  if [ $WORD_COUNT -nq 0 ]
  then
      echo "the count of the word $word in the file $FILE_NAME is ::: $WORD_COUNT "
  fi

done