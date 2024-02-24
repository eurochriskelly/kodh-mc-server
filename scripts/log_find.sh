#!/bin/bash

#zcat /opt/minecraft/logs/*.gz | grep "$1"

zgrep -l "$1" /opt/minecraft/logs/*.gz

