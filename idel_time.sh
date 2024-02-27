#!/bin/bash


APP_TO_LAUNCH="pkill anydesk; anydesk;"

# Define the idle time threshold in milliseconds (1 minute = 60 seconds * 1000 milliseconds)
IDLE_TIME_THRESHOLD=$((5*60 * 1000))

while true; do
  # Get the current idle time in milliseconds
  idle_time=$(xprintidle)

  # Check if the user has been idle for more than the threshold
  if [[ $idle_time -ge $IDLE_TIME_THRESHOLD ]]; then
    # Launch the app
    echo "User has been idle for one minute. Launching $APP_TO_LAUNCH..."
    $APP_TO_LAUNCH &
    
    # Exit the loop after launching the app
    break
  fi

  # Sleep for a short duration before checking again
  sleep 5
done