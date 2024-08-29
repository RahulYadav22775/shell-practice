#!/bin/bash


SOURCE_DIR="home/ec2-user/logs"

 if [ -d $SOURCE_DIR ] 
 then
     echo " $SOURCE_DIR exists .you can continue "
 else 
     echo " $SOURCE_DIR  dosent exists "
     exit 1
 fi
