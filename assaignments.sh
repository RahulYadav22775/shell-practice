#!/bin/bash
DIR_NAME=$1


USAGE() {
    echo " USAGE:: $0 <FILE-NAME>"
    exit 1
}

if [ $# -eq 0 ]
then 
    USAGE
fi

if [ -d $DIR_NAME ]
then 
    find $DIR_NAME -name "*.txt"  -exec sed -i 's/gopi/ravi/g' {} \;

fi
