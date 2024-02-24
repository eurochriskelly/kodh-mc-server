#!/bin/bash


players=$(zcat /opt/minecraft/logs/*.gz | grep " the game"|cut -c 34-|awk '{print $1}'|sort|uniq|grep -v TTM)


for player in $players;do
    echo "Checking player: $player ..."
    test -f /tmp/player-logins && rm /tmp/player-logins
    touch /tmp/player-logins
    zcat /opt/minecraft/logs/*.gz \
	| grep -v tellraw \
	| grep "$player" \
	| grep " the game" >> /tmp/player-logins
    if [ -f /tmp/player-logins ]; then
        echo "Player $player has been online for:"
        node addTime.js /tmp/player-logins
    fi
done
