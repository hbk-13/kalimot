#!/bin/bash
###
#    KALIMOT
#    This script runs Kali RAP or Kali Cloud
#    Usage: ./kalimot.sh
###

rap() {
	echo "[*] Running RAP"
    read -p "Enter RAPID: " RAP_ID
    echo "[+] RAP ID --> ${RAP_ID}"
    echo "[*] Loading..."
    ssh -A -t ${1}@rapgw.vikingcloud.com ssh -A -t -p ${RAP_ID} root@::1
}
rap_proxychains() {
	echo "[*] Running RAP with Proxychains"
    read -p "Enter RAPID: " RAP_ID
    echo "[+] RAP ID --> ${RAP_ID}"
    read -p "Enter Dynamic Port: " Dynamic_Port
    echo "[+] Dynamic Port --> ${Dynamic_Port}"
    echo "[*] Loading..."
    ssh -fND 127.0.0.1:${Dynamic_Port} -J ${1}@rapgw.vikingcloud.com -p ${RAP_ID} root@::1
}
rap_socks_proxy() {
	echo "[*] Running RAP with Socks Proxy"
    read -p "Enter RAPID: " RAP_ID
    echo "[+] RAP ID --> ${RAP_ID}"
    read -p "Enter Local Port: " Local_Port
    echo "[+] Local Port --> ${Local_Port}"
    read -p "Enter Dynamic Port: " Dynamic_Port
    echo "[+] Dynamic Port --> ${Dynamic_Port}"
    echo "[*] Loading..."
	ssh -A -t -L ${Local_Port}:localhost:${Dynamic_Port} ${1}@rapgw.vikingcloud.com ssh -D ${Dynamic_Port} -A -t -p ${RAP_ID} root@::1
}
kali1() {
	echo "[*] Running Kali Cloud 1"
    echo "[*] Loading..."
	ssh ${1}@10.128.0.4
}
kali2() {
	echo "[*] Running Kali Cloud 2"
    echo "[*] Loading..."
	ssh ${1}@10.128.0.6
}

menu() {
echo -ne "
=============
 ? KALIMOT ?
=============

[1] Kali RAP
[2] Kali RAP w/ Proxychains (Preferably Run on Kali VM or Kali Cloud)
[3] Kali RAP w/ Socks Proxy
[4] Kali Cloud 1 (10.128.0.4)
[5] Kali Cloud 2 (10.128.0.6)
[0] Exit

"
    read -p "Choose an Option: " option
    if [[ $option -gt 0 && $option -lt 6 ]]
    then
        read -p "Enter Username: " USERNAME
        echo "[+] Username --> ${USERNAME}"
    fi
    case $option in
        1) rap ${USERNAME}; exit 0;;
        2) rap_proxychains ${USERNAME}; exit 0;;
        3) rap_socks_proxy ${USERNAME}; exit 0;;
        4) kali1 ${USERNAME}; exit 0;;
        5) kali2 ${USERNAME}; exit 0;;
        0) echo -e "Closing..."; exit 0;;
        *) echo -e "Invalid input. Please try again."; menu;;
    esac
}

menu
