#!/bin/bash

echo ""
echo "Achievement rankings: "
zcat /opt/minecraft/logs/*.gz | grep "made the advancement" | cut -c 34- | awk '{print $1}'| sort|uniq -c|sort -n
echo ""

