#!/bin/bash
NS=$( cat /etc/xray/dns )
PUB=$( cat /etc/slowdns/server.pub )
domain=$(cat /etc/xray/domain)
#color
grenbo="\e[92;1m"
NC='\e[0m'
#install
apt update && apt upgrade
apt install python3 python3-pip git
cd /usr/bin
wget -O ~/menu.zip "https://raw.githubusercontent.com/VpnHfA/project/main/menu/menu.zip" >/dev/null 2>&1
    mkdir /root/menu
    7z e -p*HfA--$   ~/menu.zip -o/root/menu/ >/dev/null 2>&1
    chmod +x /root/menu/*
    mv /root/menu/* /usr/bin/
clear
wget https://raw.githubusercontent.com/VpnHfA/project/main/bot/VpnHfA.zip
unzip VpnHfA.zip
pip3 install -r VpnHfA/requirements.txt

#isi data
echo ""
echo -e "\e[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[42m           ADD BOT PANEL           \E[0m"
echo -e "\e[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Tutorial Creat Bot and ID Telegram${NC}"
echo -e "[*] Creat Bot and Token Bot : @BotFather${NC}"
echo -e "[*] Info Id Telegram : @MissRose_bot , perintah /info${NC}"
echo -e "\e[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -e -p "[*] Input your Bot Token : " bottoken
read -e -p "[*] Input Your Id Telegram :" admin
echo -e BOT_TOKEN='"'$bottoken'"' >> /usr/bin/VpnHfA/var.txt
echo -e ADMIN='"'$admin'"' >> /usr/bin/VpnHfA/var.txt
echo -e DOMAIN='"'$domain'"' >> /usr/bin/VpnHfA/var.txt
echo -e PUB='"'$PUB'"' >> /usr/bin/VpnHfA/var.txt
echo -e HOST='"'$NS'"' >> /usr/bin/VpnHfA/var.txt
clear

cat > /etc/systemd/system/VpnHfA.service << END
[Unit]
Description=Simple VpnHfA - @VpnHfA
After=network.target

[Service]
WorkingDirectory=/usr/bin
ExecStart=/usr/bin/python3 -m VpnHfA
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl start VpnHfA 
systemctl enable VpnHfA
systemctl restart VpnHfA
cd /root
rm -rf VpnHfA.sh
echo "Done"
echo "Your Data Bot"
echo -e "==============================="
echo "Token Bot    : $bottoken"
echo "Admin        : $admin"
echo "Domain       : $domain"
echo "Pub          : $PUB"
echo "Host         : $NS"
echo -e "==============================="
echo "Setting done"
clear

echo " Installations complete, type /menu on your bot"
