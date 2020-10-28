
#!/bin/bash

# Driver Installation:
##sudo apt-get update
##sudo apt-get upgrade


#sudo apt-get install git bc bison flex libssl-dev
#sudo wget http://downloads.fars-robotics.net/wifi-drivers/install-wifi -O /usr/bin/install-wifi
#sudo chmod +x /usr/bin/install-wifi
#sudo apt install git
#cd ~
#git clone https://github.com/xtknight/mt7610u-linksys-ae6000-wifi-fixes.git
#cd mt7610u-linksys-ae6000-wifi-fixes
#sudo apt-get install build-essential linux-headers-$(uname -r)
#make clean
#make
#sudo make install
#sudo apt-get install dkms
#sudo cp -R . /usr/src/mt7610u_sta-1.0
#sudo dkms add mt7610u_sta/1.0
#sudo dkms build mt7610u_sta/1.0
#sudo dkms install mt7610u_sta/1.0



#Set wlan0 to monitor mode and wlan0mon
##ifconfig wlan0 down
##iwconfig wlan0 mode monitor
##ifconfig wlan0 up
##airmon-ng start wlan0 > foundProcesses.txt
##sed -i 's/Found.*//g' foundProcesses.txt
##sed -i 's/Kill.*//g' foundProcesses.txt
##sed -i 's/the.*//g' foundProcesses.txt
##sed -i 's/and.*//g' foundProcesses.txt
##sed -i 's/PID.*//g' foundProcesses.txt
##sed -i '/PHY/q;p' foundProcesses.txt
##sed -i 's/PHY.*//g' foundProcesses.txt
##sed '/^$/d' foundProcesses.txt > tokill.txt
##sed 's/ .*//' tokill.txt
##sed 's/\s.*$//' tokill.txt
##sed 's/[a-zA-Z]//g' tokill.txt > killableNow.txt
##airmon-ng start wlan0

#Schleife
##p=p
##x=3
##count=$(wc -l < tokill.txt )
##while [ $x -lt $count ] ; do
##	x=$x$p
##	num=$(sed -n $x killableNow.txt)
##	kill $num
##	x=${x%?}
##	x=$(($x+1))
##done;
##airmon-ng start wlan0

#Pull Scripts from Git
git add .
git commit -m"${commitment}"



#install mosquitto and client
##apt-get install mosquitto
##apt-get install mosquitto-clients


