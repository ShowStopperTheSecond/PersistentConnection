#!/bin/bash

# Replace "CONNECTION_NAME" with the actual name of your WIFI connection
CONNECTION_NAME="TheOathBreaker"


# Loop indefinitely
while true; do
  # Check if the WIFI is connected
  if [[ $(nmcli con show "$CONNECTION_NAME" | grep -w activated) ]]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - WIFI connected"
  else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - WIFI disconnected"
    # Add your script to reconnect if needed (replace with your actual command)
    nmcli con up "$CONNECTION_NAME"
  fi
  # Sleep for 10 seconds before checking again
  sleep 10
done