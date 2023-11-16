#!/bin/bash
# Bash Menu Script Example

PS3='Please enter your choice: '
options=("Shutdown" "Reboot" "Exit" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Shutdown")
            echo "Your system will shutdown in 5 seconds. To stop that run shutdown -c"
sleep 5
shutdown  now
            ;;
        "Reboot")
            echo "Your system will shutdown in 5 seconds. To stop that run shutdown -c"
sleep 5
reboot
            ;;
        "Exit")
            echo "you chose choice $REPLY which is $opt"
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done