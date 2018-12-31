#!/bin/sh 
export HUB_PORT="${HUB_PORT:-4442}"
java -jar /etc/selenium-hub/lib/selenium.jar -role hub -port ${HUB_PORT} -hubConfig /etc/selenium-hub/conf/hub.conf.json
wait $!