#!/bin/bash
DIR_NAME=$1
# word1=$2
# word2=$3


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
    echo " the directory $DIR_NAME exists"
else
    echo " the directory $DIR_NAME does not exists"
    exit 1 
fi

LIST_FILES=$(ls -l $DIR_NAME)
echo "list of files :::: $LIST_FILES "



# if [ -d $DIR_NAME ]
# then 
    
#     sed -i 's/gopi/ravi/g' /home/ec2-user/*.txt
    
#     if [ $? -eq 0 ]
#     then 
#         echo " successfully replaced"
#     else
#         echo " failed to replace the word"
#     fi

# fi
