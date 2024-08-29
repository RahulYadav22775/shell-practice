#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3: -14} 
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USAGE() {
       echo -e " USAGE ::: sh $0  <source-directory> <destination-directoy> <days (optional)> "
       exit 1
}


if [ $# -lt 2 ]
then
    USAGE
fi


if [ ! -d $SOURCE_DIR ]
then 
    echo -e " $SOURCE_DIR does not exist "
    exit 1
fi

if [ ! -d $DEST_DIR ]
then 
    echo -e " $SDEST_DIR does not exist "
    exit 1
fi

