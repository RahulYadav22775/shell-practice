#!/bin/bash
DIR_NAME=$1


USAGE() {
    echo " USAGE:: $0 <FILE-NAME>"
    exit 1
}

# replacing  a word with another in all strigs

if [ $# -eq 0 ]
then 
    USAGE
fi

# if [ -d $DIR_NAME ]
# then 
#     find $DIR_NAME -name "*.txt"  -exec sed -i 's/gopi/ravi/g' {} \;

# fi

if [ -d $DIR_NAME ]
then 
    sed -i 's/gopi/ravi/g' /home/ec2-user/*.txt

fi
