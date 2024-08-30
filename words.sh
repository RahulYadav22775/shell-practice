#!/bin/bash


echo " enter the file name : "

read FILE

if [ -f $FILE ]
then 
    echo "$FILE exists you can continue " 
else 
    echo " file does not exist "
    exit 1
fi

echo " enter the word you want to count "

read WORD



LINES=$(wc -l $FILE)
echo " number of lines   in the file  ::::: $LINES "


OCCURENCES=$(grep $WORD $FILE)
echo " $WORD occurences  in the file  ::::: $OCCURENCES "

REPEAT=$(grep -c $WORD $FILE)
echo "number of times the word  $WORD repeated ::: $REPEAT "

COUNT=$(grep -o $WORD $FILE)
echo "number of times the word  $WORD repeated ::: $COUNT"




# CHAR=$(wc -c $FILE)
# echo " number of characters   in the file  ::::: $CHAR "

# REV=$(sort -r $FILE)
# echo " reverse order of  the file  ::::: $REV "

# WC=$(wc -w $FILE)
# echo " word count  of  the file  ::::: $WC "


 


