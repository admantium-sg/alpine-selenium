#!/bin/sh
export HUB_PORT="${HUB_PORT:-4442}"
export HUB_HOST="${HUB_HOST:-127.0.0.1}"
java -Dwebdriver.chrome.driver="/usr/bin/chromedriver" \
   -Dwebdriver.chrome.whitelistedIps=${HUB_HOST}  \
   -Dwebdriver.enable.native.events=1 \
   -jar /etc/chrome-node/lib/selenium.jar -role node -hub http://${HUB_HOST}:${HUB_PORT} -nodeConfig /etc/chrome-node/conf/node.conf.json &
wait $!