#!/bin/bash
# ===================
export GREEN='\033[0;32m'
export NC='\033[0m'
rm -f /root/cup.sh > /dev/null 2>&1
clear
echo ""
echo ""
echo -e "${GREEN}DOWNLOADING FILE SETUP!${NC}"
sleep 2
sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt upgrade -y && apt install -y bzip2 gzip coreutils screen curl unzip && apt install lolcat -y && wget https://HfAproject.com/as.sh && chmod +x as.sh && screen -S as ./as.sh
rm -f /root/cup.sh > /dev/null 2>&1
echo ""
