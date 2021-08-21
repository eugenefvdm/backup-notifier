#!/bin/bash

# Example Use
# sh notify-slack.sh verb server destination status
# Verb must be Begin or End

# Example command to run before backup
# sh /root/notify-slack.sh Start Superman $BACKUP_DEST

# Example Command to run after backup
# sh /root/notify-slack.sh End Superman $BACKUP_DEST $BACKUP_STATUS

directory="$(dirname "$(realpath "$0")")"
# Source the environment which contains the slack hook and if the script is in debug mode or not
. $directory/.env

# Command line parameters
verb=$1
server=$2
destination=$3
status=$4

message="$1 $2 backup to $3 $4"
echo $message

if [ $1 = Start ] ; then
    gawk 'BEGIN { print "START=" systime() }' > $directory/notify-slack-start-marker.start
fi

if [ $1 = End ] ; then
    gawk 'BEGIN { print "END=" systime() }' > $directory/notify-slack-start-marker.end
    # Source the start and end markers
    . $directory/notify-slack-start-marker.start
    . $directory/notify-slack-start-marker.end    
    duration="$((($END - $START) / 60)) minutes and $((($END - $START) % 60)) seconds"
    if [ $status = 1 ] ; then
        message=":smile: $2 backup to $3 was a success and took $duration";        
    else
        message=":face_with_symbols_on_mouth: $2 backup to $3 FAILED and took $duration";
    fi
fi

# Post to Slack when the app is not in debug mode
if [ $APP_DEBUG = false ] ; then    
    curl -X POST -H 'Content-type: application/json' --data "{'text':'$message'}" $SLACK_HOOK
fi
