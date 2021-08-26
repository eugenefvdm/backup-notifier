#!/bin/bash

# Example Use
# /bin/bash notify-slack.sh

# Get the current directory
directory="$(dirname "$(realpath "$0")")"

# Source the environment to read SLACK_HOOK and POST_TO_SLACK
. $directory/.env

# Check if APP_DEBUG was found in the .env file
if [ ! -v ${APP_DEBUG} ] ; then
    # Set debug true or false which allows easy output further in the script
    if [ $APP_DEBUG = true ] ; then
        echo "Debug: On"
        debug=true
    else
        debug=false
    fi
fi

host=$(hostname)

if [ $debug = true ] ; then
    echo "Debug: Host set to $host"
fi

message="$host backup to $BACKUP_DEST"

if [ $debug = true ] ; then
    echo "Debug: Message: $message"
fi

# Check if the BACKUP_STATUS variable doesn't exist
if [[ -z ${BACKUP_STATUS+x} ]] ; then
    echo "BACKUP_STATUS not present so writing start marker"
    gawk 'BEGIN { print "START=" systime() }' > $directory/notify-slack-start-marker.start
    message="${message} has started"
else
    echo "BACKUP_STATUS is present so writing end marker"
    gawk 'BEGIN { print "END=" systime() }' > $directory/notify-slack-start-marker.end
    # Source the start and end markers
    . $directory/notify-slack-start-marker.start
    . $directory/notify-slack-start-marker.end    
    duration="$((($END - $START) / 60)) minutes and $((($END - $START) % 60)) seconds"
    if [ $BACKUP_STATUS = 1 ] ; then
        message=":smile: $host backup to $BACKUP_DEST was a success and took $duration"
    else
        message=":face_with_symbols_on_mouth: $host backup to $BACKUP_DEST FAILED and took $duration"
    fi
fi

echo "Message: $message"

# Check if POST_TO_SLACK exists
if [[ ! -z ${POST_TO_SLACK+z} ]] ; then    
    if [ $POST_TO_SLACK = true ] ; then # -s Silent -X Custom request (POST)            
        echo "Posting backup report to Slack"
        curl -s -X POST -H 'Content-type: application/json' --data "{'text':'$message'}" $SLACK_HOOK
    fi
fi
