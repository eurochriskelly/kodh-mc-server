#!/bin/bash

confDir=minecraft/plugins/Geyser-Spigot
mkdir -p $confDir 
cp config/geyser.yml $confDir/config.yml

if [ ! -f "$confDir/../Geyser-Spigot.jar" ];then
  echo "Error: geyser missing. Not going to start minecraft if everyone can't join :("
  exit 1
fi
cd minecraft/

java -Xmx3048M -Xms3048M -jar paper.jar nogui

