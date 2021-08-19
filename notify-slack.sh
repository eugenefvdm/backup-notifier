#!/bin/bash

# Example

# Command to run before backup
# sh /root/notify-slack.sh Begin Superman $BACKUP_DEST

# Command to run after backup
# sh /root/notify-slack.sh End Superman $BACKUP_DEST $BACKUP_STATUS

# Command line parameters
verb=$1
server=$2
destination=$3
status=$4

message="$1 $2 backup $3 $4"
echo $message

# Read the Slack Hook URL from the .env file
source /root/.env

# Post to Slack
curl -X POST -H 'Content-type: application/json' --data "{'text':'$message'}" $SLACK_HOOK
