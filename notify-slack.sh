#!/bin/bash

directory="$(dirname "$(realpath "$0")")"

#directory=/home/eugene/code/virtualmin-slack-backup-notification

# Example Use
# verb server destination status

# Command to run before backup
# sh /root/notify-slack.sh Start Superman $BACKUP_DEST

# Command to run after backup
# sh /root/notify-slack.sh End Superman $BACKUP_DEST $BACKUP_STATUS

# Variables
# directory=/root

# Source the environment: SLACK_HOOK, APP_ENV, APP_DIRECTORY
. $directory/.env

#if [$APP_ENV = 'local']
#then
    #directory=$APP_DIRECTORY
#fi

# Command line parameters
verb=$1
server=$2
destination=$3
status=$4

message="$1 $2 backup to $3 $4"
echo $message

if [ $1 = Start ]
then
    gawk 'BEGIN { print "START=" systime() }' > $directory/notify-slack-start-marker.start
fi

if [ $1 = End ]
then
    gawk 'BEGIN { print "END=" systime() }' > $directory/notify-slack-start-marker.end
    . $directory/notify-slack-start-marker.start
    . $directory/notify-slack-start-marker.end    
    echo "The backup took $((($END - $START) / 60)) minutes and $((($END - $START) % 60)) seconds"
fi

# Post to Slack
# curl -X POST -H 'Content-type: application/json' --data "{'text':'$message'}" $SLACK_HOOK
