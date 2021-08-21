#!/bin/bash

# Example Use
# verb server destination status


# Command to run before backup
# sh /root/notify-slack.sh Start Superman $BACKUP_DEST

# Command to run after backup
# sh /root/notify-slack.sh End Superman $BACKUP_DEST $BACKUP_STATUS

# Variables
#directory=/home/eugene/code/virtualmin-slack-backup-notification
directory=/root

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
    thetime=$START-$END
    echo "The backup took $((($END - $START) / 60)) minutes and $((($END - $START) % 60)) seconds"
fi

# Read the Slack Hook URL from the .env file
. $directory/.env

# Post to Slack
# curl -X POST -H 'Content-type: application/json' --data "{'text':'$message'}" $SLACK_HOOK
