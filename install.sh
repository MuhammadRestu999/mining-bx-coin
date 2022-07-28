bi="\033[34;1m" #biru
i="\033[32;1m" #ijo
me="\033[31;1m" #merah
ku="\033[33;1m" #kuning
def="\033[0;0m" #default


echo -e "${bi}[${ku}-${bi}] ${def}Update"
sleep 0.5
apt update -y
sleep 0.5
clear

echo -e "${bi}[${ku}-${bi}] ${def}Upgrade"
apt upgrade -y
sleep 0.5
clear

echo -e "${bi}[${ku}-${bi}] ${def}Sedang menginstall"
sleep 1
echo
sleep 0.2
echo
sleep 0.5
echo -e "${bi}[${ku}-${bi}] ${def}Mendeteksi node"
sleep 0.5
if [[ -x $(command -v node) ]]
then
    echo -e "${bi}[${i}✓${bi}] ${def}NodeJS sudah terinstall"
    sleep 1
else
    echo -e "${bi}[${me}×${bi}] ${def}NodeJS belum terinstall"
    sleep 1
    apt install nodejs-lts -y
    sleep 1
    clear
fi
sleep 0.5
echo -e "${bi}[${ku}-${bi}] ${def}Mendeteksi nano"
if [[ -x $(command -v nano) ]]
then
    echo -e "${bi}[${i}✓${bi}] ${def}nano sudah terinstall"
    sleep 1
else
    echo -e "${bi}[${me}×${bi}] ${def}nano belum terinstall"
    sleep 1
    apt install nano -y
    sleep 1
    clear
fi


echo -e "${bi}[${ku}-${bi}] ${def}Edit nomor hpmu"
sleep 3

while true
do
  nano config.json
  clear
  printf "Nomor HP : "
  cat config.json | cut -d":" -f2 | cut -d"\"" -f2 | cut -d"
" -f2
  echo
  echo "Benar?"
  read -p "[y/n] " confirm
  if [ "$confirm" == "y" ] || [ "$confirm" == "Y" ]
  then
    break
  fi
done
sleep 1
clear
echo -e "${bi}[${i}✓${bi}] ${def}Done"
