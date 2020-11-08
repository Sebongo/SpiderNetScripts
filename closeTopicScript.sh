#!bin/bash

email=$(sed -n 2p spiderNet.conf)
passwd=$(sed -n 4p spiderNet.conf)
raspberryName=$(sed -n 6p spiderNet.conf)
topicToPublish=$email"/"$raspberryName
mosquitto_pub -r -h lavis.ddns.net -t $topicToPublish -p 8883 -f toBroker.txt  -u $email -p $passwd
