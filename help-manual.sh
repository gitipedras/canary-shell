#!/bin/bash
echo "Welcom to the Canary help menu!"
echo "Use the up,down,left and right keys to navigate on option 1, and press q to quit the manual."
PS3="Help Manual :"

select opt in print_manual quit; do

  case $opt in
    print_manual)
less manual.txt
echo " "
;;
    quit)
      break
      ;;
    *) 
      echo "No such file or command: $REPLY"
      ;;
  esac
done
