PS3="$USER@canary-shell> "

select opt in disk calculator htop nano IP UPDATE_APT session quit root bash neofetch version clear help; do

  case $opt in
    disk)
     lsblk
;;
help)
     ./help-manual.sh
;;
clear)
     clear
;;
    calculator)
      ./calculator.sh
;;
    root)
      su
      ;;
    bash)

echo "Starting bash shell"
sleep 2
bash
      ;;
    htop)
htop
echo "Process closed"
      ;;
UPDATE_APT)
sudo apt-get update
;;
IP)
/sbin/ifconfig | less
echo "Process closed"
      ;;
  nano)
nano
echo "Process closed"
      ;;
 session)
./session.sh
echo "Process closed"
      ;;
version)
echo "############################################"
echo "#"
echo "#Canary Project"
echo "#"
echo "############################"
echo "Canary version: 1.0-beta"
      ;;

neofetch)
REQUIRED_PKG="neofetch"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "package is installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  sudo apt-get --yes install $REQUIRED_PKG
fi
neofetch
;;
    quit)
echo "Closing canary...."
echo -ne '                       (0%)\r'
sleep 1
echo -ne '#####                  (33%)\r'
sleep 1
echo -ne '#############          (66%)\r'
sleep 1
echo -ne '#######################(100%)\r'
echo -ne '\n'
echo "Bye $USER!"
      break
      ;;
    *) 
      echo "No such file or command: $REPLY"
      ;;
  esac
done
