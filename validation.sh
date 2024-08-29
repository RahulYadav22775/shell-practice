#!/bin/bash

set -ex


echo "hello"
echo "hi"
echh "hw r u"
echo "i am gud "

failure() {
    echo " failed at : $1 :: $2 "
}

trap 'failure ${LINED} ${BASH_COMMAND}' ERR
