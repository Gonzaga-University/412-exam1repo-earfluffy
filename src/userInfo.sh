#!/bin/bash

if [ -n "$2" ] || [ -z "$1" ]
then
    echo "usage:"
    echo ""
    echo "    lstenhome.sh <username>"
    echo ""
    exit
fi

USERNAME=$1

PASSWD_NUM_LINES=`grep ${USERNAME}:x /etc/passwd | grep -v nologin | wc -l`

if [ $PASSWD_NUM_LINES -lt 1 ]
then
    echo "user does not exist or cannot log in"
    exit
fi

USERHOME=`getent passwd $USERNAME | cut -d: -f6`

ls -A $USERHOME | head
du -sh $USERHOME
