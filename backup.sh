#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3: -14} 
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

failure() {
    echo " failed at :: $1 , $2 "
}

trap ' failure "${LINED}" "${BASH_COMMAND}"' ERR

USAGE() {
       echo -e " USAGE ::: sh $0  <source-directory> <destination-directoy> <days (optional)> "
       exit 1
}

echo "script started exexuted at :: $(date)"

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then 
    echo -e " $SOURCE_DIR does not exist "
    exit 1
else 
    echo -e "$SOURCE_DIR exists...."
fi

if [ ! -d $DEST_DIR ]
then 
    echo -e " $DEST_DIR does not exist "
    exit 1
else 
    echo -e "$DEST_DIR exists...."
fi

FILE=$(find $SOURCE_DIR -name "*.log" -mtime +14 )

if [ -z $FILE ]
then
    echo " files are not  found"
    exit 1
else  
    echo "files are found"
    ZIP_FILE="$DEST_DIR/app-data-${TIMESTAMP}.zip"
    find $SOURCE_DIR -name "*.log" -mtime +14 | zip "$ZIP_FILE" -@

    if [ -f $ZIP_FILE ]
    then 
        echo -e " $ZIP_FILE is successfully created "
    else 
        echo " $ZIP_FILE is not created "
        exit 1
    fi
fi

while IFS= read -r file
do 
   echo " deleting file :: $file "
   rm -rf $file
  
done <<< $FILE




