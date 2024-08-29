#!/bin/bash

SOURCE_FILES=$(df -hT | grep xfs)
THRESHOLD=5


while IFS= read -r files
do
  FILE_NAME=$files | awk -F " " '{print $NF}'
  FILE_THRESHOLD=$files | awk -F " " '{print $6F}' | cut -d "%" -f1
  if [ $FILE_THRESHOLD -gt $THRESHOLD ]
  then 
      echo " $FILE_NAME is exceeded the threshold memory "
  fi
done <<< $SOURCE_FILES