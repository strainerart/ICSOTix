#!/bin/bash
# Author: Mike Art Rebultan aka 0xStrainer
# Banner: ART (Audit and Recon Tool)

echo ""
echo -e "\e[32m==========================================="
echo -e "           ICSOTix Network Auditor          "
echo -e "==========================================="
echo -e "          ART (Audit and Recon Tool)        "
echo -e "     By Mike Art Rebultan aka 0xStrainer    "
echo -e "===========================================\e[0m"
echo ""


echo "Welcome to ART (Audit and Recon Tool)!"
read -p "Enter target IP, Domain, or IP range to Scan: " target
echo ""

echo "Please select the type of audit to perform:"
echo "1. Scan for open ports"
echo "2. Map the network"
echo "3. Check for vulnerabilities"
echo "4. Check for honeypots"
echo "5. Scan for all ports and services"
echo "6. Identify operating system"
echo "7. Run default scripts"
echo "8. Scan for open UDP ports"
echo "9. Identify potential firewall or filtering devices"
echo ""

read -p "Enter option number: " audit
echo ""

case $audit in
    1)
        nmap -sS -T4 $target
        ;;
    2)
        nmap -sP $target
        ;;
    3)
        nmap -sV --script vuln $target
        ;;
    4)
        nmap -sS -p 21,22,23,25,53,80,110,139,143,443,445,3389 --data-length 5 --badsum --randomize-hosts $target
        ;;
    5)
        nmap -p1-65535 -sV -sS -T4 $target
        ;;
    6)
        nmap -O $target
        ;;
    7)
        nmap -sC $target
        ;;
    8)
        nmap -sU $target
        ;;
    9)
        nmap -sS -p 1-65535 --reason $target
        ;;
    *)
        echo "Invalid option selected. Please try again."
        exit 1
        ;;
esac

echo ""
echo -e "\e[32m==========================================="
echo -e "        ICSOTix audit completed.           "
echo -e "===========================================\e[0m"
echo ""
echo ""