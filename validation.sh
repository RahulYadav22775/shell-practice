#!/bin/bash


SOURCE_DIR=$1



 if [ -d $SOURCE_DIR ] 
 then
     echo " $SOURCE_DIR exists .you can continue "
 else 
     echo " $SOURCE_DIR  dosent exists "
     exit 1
 fi
