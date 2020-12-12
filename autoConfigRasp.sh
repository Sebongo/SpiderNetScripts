#!/bin/bash
# Driver Installation:
sudo apt-get update
sudo apt-get upgrade
#Set wlan0 to monitor mode and wlan0mon
ifconfig wlan0 down  #Wlan wird ausgeschalten damit wlan0mon eingeschalten werden kann
iwconfig wlan0 mode managed      #ohne Mode managed kein wlan0mon

#Der Command schaltet wlan0 zu wlan0mon. Es müssen zuvor aber ein paar Prozesse gelöscht werden, welche ebenfalls im Commandoutput vorkommen.
#Diese werden dann heraussortiert und zuerst gekillt. Dann wird der airmon-ng Comman wieder ausgeführt wodurch wlan0mon auftaucht.
#Wlan0mon muss man nun in den monitor mode setzen, damit er Wlandaten auslesen kann. Außerdem muss das Wlan noch eingeschalten werden. 
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
iwconfig wlan0mon mode monitor
iwconfig wlan0mon up
#Pull Scripts from Git
#git clone https://github.com/Sebongo/SpiderNetScripts.git
#install mosquitto and client
#apt-get install mosquitto
#apt-get install mosquitto-clients
