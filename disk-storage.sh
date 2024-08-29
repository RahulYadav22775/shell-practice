#!/bin/bash

SOURCE_FILES=$(df -hT | grep xfs)
THRESHOLD=5


while IFS= read -r files
do
  FILE_NAME=$(echo $files | awk -F " " '{print $NF}')
  FILE_THRESHOLD=$(echo $files | awk -F " " '{print $6F}' | cut -d "%" -f1)
  if [ $FILE_THRESHOLD -ge $THRESHOLD ]
  then 
      echo " $FILE_NAME is exceeded the threshold memory ...current memory is $FILE_THRESHOLD "
  fi
done <<< $SOURCE_FILES