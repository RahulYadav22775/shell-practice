#!/bin/bash
DIR_NAME=$1
word1=$2
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

for FILE in $LIST_FILES
do
    grep $2 $file
    if [ $? -eq 0 ] 
    then
        sed -i 's/$WORD1/$WORD2/g' $FILE
        if [ $? -eq 0 ]
        then
            echo " $WORD1 is found in $FILE is successfully replaced with $WORD2 " 
        else
           echo "  replacig the the word $WORD1 is failed "
        fi
    else
        echo " $WORD1 is not found in $FILE "
    fi

done



 #replacing word with another word in multiple files at a time 
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
