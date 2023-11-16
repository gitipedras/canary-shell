#!/bin/bash
# Bash Menu Script Example
echo "Sysadmin 0.1.0 canary"
PS3='sysadmin console $USER@canary =# '
options=("view_users" "system_update" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "view_users")
awk -F':' '{ print $1}' /etc/passwd

            ;;
        "system_update")
            ./sysupdate.sh
            ;;
        "Exit")
            echo "you chose choice $REPLY which is $opt"
            ;;
        "Quit")
            break
            ;;
        *) echo "No such option as: $REPLY";;
    esac
done
