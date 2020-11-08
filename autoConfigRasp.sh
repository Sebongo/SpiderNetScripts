
#!/bin/bash

# Driver Installation:
#sudo apt-get update
#sudo apt-get upgrade

#Set wlan0 to monitor mode and wlan0mon
ifconfig wlan0 down
iwconfig wlan0 mode monitor
ifconfig wlan0 up
airmon-ng start wlan0 > foundProcesses.txt
sed -i 's/Found.*//g' foundProcesses.txt
sed -i 's/Kill.*//g' foundProcesses.txt
sed -i 's/the.*//g' foundProcesses.txt
sed -i 's/and.*//g' foundProcesses.txt
sed -i 's/PID.*//g' foundProcesses.txt
sed -i '/PHY/q;p' foundProcesses.txt
sed -i 's/PHY.*//g' foundProcesses.txt
sed '/^$/d' foundProcesses.txt > tokill.txt
sed 's/ .*//' tokill.txt
sed 's/\s.*$//' tokill.txt
sed 's/[a-zA-Z]//g' tokill.txt > killableNow.txt
sed 's/.$//' killableNow.txt
p=p
x=3
count=$(wc -l < tokill.txt )
while [ $x -lt $count ] ; do
	x=$x$p
	num=$(sed -n $x killableNow.txt)
	kill $num
	x=${x%?}
	x=$(($x+1))
done;
airmon-ng start wlan0

#Pull Scripts from Git
#git clone https://github.com/Sebongo/SpiderNetScripts.git

#install mosquitto and client
#apt-get install mosquitto
#apt-get install mosquitto-clients


