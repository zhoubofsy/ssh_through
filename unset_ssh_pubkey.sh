#!/bin/sh

# get current user
current_user=$USER

while read line
do
    echo "$line $current_user"
    expect ./close_12n_without_pwd.exp $line
done < ./target_list

