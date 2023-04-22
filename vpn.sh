#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title VPN Manager
# @raycast.mode inline

# Optional parameters:
# @raycast.icon icons/vpn_manager.png

# Documentation:
# @raycast.author Abtin Okhovat

#!/bin/bash

VPN_STATUS=$(scutil --nc list | grep Connected)
# Replace with the name of your VPN configuration
VPN_NAME="Freedom VPN"

# toggle vpn connection
if [ -z "$VPN_STATUS" ]
then
    # VPN is not connected    
    scutil --nc start "$VPN_NAME"

    if [ $? -eq 0 ]
    then
        echo -e "\033[32mVPN connection established successfully.\033[0m"
    else
        echo "Failed to establish VPN connection."
        exit 1
    fi
else
    # VPN is connected
    scutil --nc stop "$VPN_NAME"

    if [ $? -eq 0 ]
    then
        echo -e "\033[31mVPN disconnected successfully.\033[0m"
    else
        echo "Failed to disconnect VPN connection."
        exit 1
    fi
fi



