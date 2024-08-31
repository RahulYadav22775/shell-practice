#!/bin/bash

#print the numbers which are divisible ny 3 or 5 but not 15

for i in {1..100}
do
if ([ 'expr $i % 3' == 0 ] || [ 'expr $i % 5' == 0 ]) && [ 'expr $i % 15' != 0 ]
then
   echo $i
fi
done


#print number of occurences of lettter s in messisippi

a=missisippi

result=$(grep -o "s">>>"$a" | wc -l)
echo "numbe rof occurences is :: $result "

# open a file in read only mode
# vim -r <file-name>

#  What do you understand by a shell?
# Shell is a command-line interpreter that translates user-entered commands into kernel understandable language. The shell interprets the command typed in at the terminal and calls the required program. 

# What is the alternative command for echo?
# The alternative command for echo is tput. This command allows us to control how the output is displayed on the screen. 

# Name standard streams in Linux.
# The standard streams in Linux are Standard Input, Standard Output, and Standard Error. 

#  Differentiate between $@ and $*.
# $* considers an entire set of positional arguments as a single string whereas, $@ treats each quote argument as a separate argument.  

# Use the echo command to get part of a string variable. 
# This is how we can get part of string variable using echo command only: 
# echo ${variable:x:y}
# Where X is the starting position and y is the string length. 
# example:
# variable="Her name is Jen, and she is a developer."
# # echo ${variable:12:6} # will display Jen

# What is the difference between [[ $string == "efg*" ]] and [[ $string == efg* ]] ?
# [[ $string == efg* ]] – checks if string begins with efg. 
# [[ $string == "efg*" ]] – checks if string is efg.

# How will you debug problems encountered in the shell program?
# Some standard methods of debugging the problems in the script are:
# use of set-x to enable debugging
# Insert debug statements in a shell script to display information that helps in the identification of the problem. 

# Name two files of the crontab command. 
# The two crontab command files are:
# cron. deny- decides the user that needs to be prevented from using crontab command
# cron. allow- decides the user that needs to be permitted to use the crontab command

# What is the lifespan of a shell variable?
# A variable is inside the shell script only until the end of execution

# What does the . (dot) indicate at the beginning of the file name? How can it be listed?
# If the file name begins with ".", it is a hidden file. When a dot appears at the beginning of a filename, the file is hidden in most file managers and shell programs. A Shell usually lists all the files except hidden files when you try to list the files in a shell. Despite this, hidden files can be found in the directory. The Is command must be run with the "–a" flag if you wish to see hidden files.

# How will you find total shells available in your system?
# Within your system, there are several shells available. If you want to find all the shells on the system, you can use $ cat /etc/shells. 
# Example: 
# $ cat /etc/shells 

# Find command: The FIND command searches for files and folders based on the requirement
# Grep command: This command facilitates searching and displaying particular thing  which is required

Pipe command : pipe command allows to join several commands. here output of the previous command will act as input for the next command