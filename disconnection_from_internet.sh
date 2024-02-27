# Function to check for internet connection
CONNECTION_NAME="sutech"
function is_connected() {
  # Replace "ping -c 1 google.com > /dev/null 2>&1" with your preferred connectivity check
  ping -c 1 google.com > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    return 0  # Connected
  else
    return 1  # Disconnected
  fi
}

# Function to restart applications
function restart_apps() {
  # Replace "service application1 restart && service application2 restart" with your specific commands for restarting applications
  pkill anydesk &
  anydesk &
  nmcli con up "$CONNECTION_NAME" &

}

# Main loop
while true; do
  if ! is_connected; then
    echo "Disconnected, restarting applications..."
    restart_apps
  fi
  sleep 60  # Check every minute
done