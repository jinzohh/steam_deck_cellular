#!/bin/bash

function connect_lte()
{
    ls /dev/ttyUSB3
    if [ $? = 0 ]
    then
        echo "LEMBAS connected!"
        sleep 1
        sudo ls /etc/ppp/peers/lembas-ppp
        if [ $? = 0 ]
        then
            echo "Connecting to LTE..."
            sleep 2
            sudo pppd call lembas-ppp & PID_PPPD=$!
            sleep 10
            sudo route del default
            sudo route add default ppp0
        else
            echo "First time activating device. Installing dependencies..."
            sleep 2
            # Move dependency packages over to /etc/ppp/peers directory
            sudo mv /home/deck/steam_deck_cellular/deps/lembas-chat-connect /etc/ppp/peers
            sudo mv /home/deck/steam_deck_cellular/deps/lembas-chat-disconnect /etc/ppp/peers
            sudo mv /home/deck/steam_deck_cellular/deps/lembas-ppp /etc/ppp/peers
            # Now connecting...
            sudo pppd call lembas-ppp & PID_PPPD=$!
            sleep 10
            sudo route del default
            sudo route add default ppp0
        fi
    else
        echo "LEMBAS not connected..."
    fi
}

while true; do
    connect_lte
    sleep 1
done