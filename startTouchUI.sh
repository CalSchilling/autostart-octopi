#!/bin/bash

function check_octoprint {
  pgrep -n octoprint > /dev/null
  return $?
}

until check_octoprint
do
  sleep 1
done

sleep 5s
sudo x11vnc

chromium-browser -start-fullscreen http://192.168.1.8 --display=:0 &
sleep 10s
xte "key F11" -x:0
#xte requires xautomation to be installed
