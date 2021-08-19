#!/bin/bash

# Example
# sh /root/backup-report.sh superman $BACKUP_DEST $BACKUP_STATUS

status=$3
destination=$2
message="$1 backup report for $2 is $3"
echo $message

# Read the Slack Hook URL from the .env file
source /root/.env

# Post to Slack
curl -X POST -H 'Content-type: application/json' --data "{'text':'$message'}" $SLACK_HOOK

