#!/bin/bash

# Example Use
# sh notify-slack.sh verb host destination
# Verb must be Begin or End

# Example command to run before backup
# sh /root/notify-slack.sh Start Superman $BACKUP_DEST

# Example Command to run after backup
# sh /root/notify-slack.sh End Superman $BACKUP_DEST $BACKUP_STATUS

directory="$(dirname "$(realpath "$0")")"
# Source the environment which contains the Slack Hook and determines via APP_ENV if the script should output to Slack
. $directory/.env

# Command line parameters
host=$(hostname)
destination=$1

echo "Host set to $host"

message="$host backup to $destination"
echo $message

[ -v ${BACKUP_STATUS} ] && echo "\${BACKUP_STATUS} not defined" || echo "\${BACKUP_STATUS} is defined"

if [[ -z ${BACKUP_STATUS+x} ]] ; then
    echo "Start of backup detected, writing start marker"
    gawk 'BEGIN { print "START=" systime() }' > $directory/notify-slack-start-marker.start
else
    echo "End of backup detected, writing end marker"
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

echo "Result: $message"

# Post to Slack when the app is not in debug mode
if [ $POST_TO_SLACK = true ] ; then   
    # -s Silent -X Custom request (POST)    
    echo "Posting backup report to Slack"
    curl -s -X POST -H 'Content-type: application/json' --data "{'text':'$message'}" $SLACK_HOOK
fi
