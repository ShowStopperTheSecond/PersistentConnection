#!/bin/bash

# Replace "CONNECTION_NAME" with the actual name of your VPN connection
CONNECTION_NAME="sutech"


# Loop indefinitely
while true; do
  # Check if the VPN is connected
  if [[ $(nmcli con show "$CONNECTION_NAME" | grep -w connected) ]]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - VPN connected"
  else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - VPN disconnected"
    # Add your script to reconnect if needed (replace with your actual command)
    nmcli con up "$CONNECTION_NAME"
  fi
  # Sleep for 10 seconds before checking again
  sleep 10
done