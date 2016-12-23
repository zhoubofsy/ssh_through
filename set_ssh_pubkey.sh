#!/bin/sh

# get current user
current_user=$USER

# create local pub key
if [ -f ~/.ssh/id_rsa.pub ]; then
    echo "pubkey exists"
else
    expect ./auto-ssh-keygen.exp
fi

while read line
do
    echo "$line $current_user"
    expect ./open_12n_without_pwd.exp $line $current_user
done < ./target_list

