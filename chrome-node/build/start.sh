#!/bin/sh 
java -Dwebdriver.chrome.driver="/usr/bin/chromedriver" \
   -Dwebdriver.chrome.whitelistedIps=$HUB_HOST  \
   -Dwebdriver.enable.native.events=1 \
   -jar /etc/chrome-node/lib/selenium.jar -role node -hub http://$HUB_HOST:$HUB_PORT -nodeConfig /etc/chrome-node/conf/node.conf.json &
wait $!