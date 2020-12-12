#!/bin/bash

email=$(sed -n 2p spiderNet.conf)
passwd=$(sed -n 4p spiderNet.conf)
raspberryName=$(sed -n 6p spiderNet.conf)
topicToPublish=$email"/"$raspberryName
#mosquitto_sub -h lavis.ddns.net -t $topicToPublish -p 8883 -u $email -P $passwd --remove-retained
mosquitto_pub -h lavis.ddns.net -t $topicToPublish -p 8883 -u $email -P $passwd -n -r -d
#mosquitto_pub -h lavis.ddns.net -t $topicToPublish -p 8883 -u $email -P $passwd -m


