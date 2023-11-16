#!/bin/bash
# Bash Menu Script Example
echo "You will need to run as root!"
echo "System updater 0.1.0"
PS3='Select a package manager to update packages:'
options=("apt" "dnf" "snap" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "apt")
echo "Updating using apt..."
sleep 3
sudo apt-get update
            ;;
          "dnf")
echo "The following packages installed using dnf will be updated:"
dnf check-update
sleep 5
echo "Updating using dnf..."
sleep 3
sudo dnf update
    ;;
         "snap")
echo "Updating using snap..."
sleep 3
sudo snap refresh
            ;;
        "Quit")
            break
            ;;
        *) echo "No such option as: $REPLY";;
    esac
done
