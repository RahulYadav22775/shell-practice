#!/bin/bash

set -ex

failure() {
    echo " failed at : $1 :: $2 "
}

trap 'failure ${LINED} ${BASH_COMMAND}' ERR

echo "hello"
echo "hi"
echh "hw r u"
echo "i am gud "