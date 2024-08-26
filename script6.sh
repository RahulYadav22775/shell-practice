#!/bin/bash
 
 NUMBER1=$1
 NUMBER2=$2

 SUM=$(($NUMBER1+$NUMBER2))
 echo " sum of  $NUMBER1 & $NUMBER2 is : $SUM "

 echo " all the arguments/inputs : $@ "
 
 echo " total number of arguments : $# "

 echo " name of the script : $0 "

 echo " process id of the current script : $$ "

 sleep 10 &

 echo " process id of the previous script : $! "

 echo " present workig directory : $PWD "


 echo " present user home directory : $HOME "