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
            sudo mkdir /opt/steam_deck_cellular
            sudo cp $HOME/steam_deck_cellular/activate_cell.sh /opt/steam_deck_cellular
            sudo cp $HOME/steam_deck_cellular/README.md /opt/Steam_deck_cellular
            sudo chmod +x /opt/steam_deck_cellular/activate_cell.sh
            sudo cp $HOME/steam_deck_cellular/deps/lembas-chat-connect /etc/ppp/peers
            sudo cp $HOME/steam_deck_cellular/deps/lembas-chat-disconnect /etc/ppp/peers
            sudo cp $HOME/steam_deck_cellular/deps/lembas-ppp /etc/ppp/peers
            sudo cp $HOME/steam_deck_cellular/LTE.service /etc/systemd/system
            sudo chmod 644 /etc/systemd/system/LTE.service
            sudo systemctl enable LTE.service
            sleep 1
            reboot
        fi
    else
        echo "LEMBAS not connected..."
    fi
}

function reboot()
{
	echo "System reboot is required"
	read -r -p "Reboot now? [Y/n] " input </dev/tty
	input=${input:-Y}
	
	case $input in
		[yY][eE][sS]|[yY])
			echo "Yes"
			sudo reboot
			;;
	
		[nN][oO]|[nN])
			echo "No"
			;;
	
		*)
			echo "Input invalid..."
			exit 1
			;;
	esac
}

while true; do
    ip address show ppp0
    if [ $? = 0 ]
    then
        echo "LEMBAS is currently operational..."
    else
        echo "LEMBAS is currently not operational..."
        connect_lte
    fi
    sleep 1
done