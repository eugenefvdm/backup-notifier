# Virtualmin Slack Backup Notification

## Description

A Slack Hook notifier designed to work as pre- and post-backup command notifiers for Virtualmin backups

## Usage

- Copy the file in this repo `notify-slack.sh` to any directory, say `/root/backup-notifier`
- Create a new Slack hook
- Store the Slack hook URL in an `.env` file
-- Warning - if you skip this step and you also use the pre-backup command, your backup job will fail
- Use the Virtualmin UI to populate the the pre- and post-backup commands

### Create a Slack App and get the hook URL

A Slack App is the basic neccesity one needs before being able to use a Slack hook.

Follow the Slack instructions here to create a new App.

https://slack.com/intl/en-za/help/articles/115005265063-Incoming-webhooks-for-Slack

### Create a .env file with your newly created Slack hook

Copy .env.example to .env

`SLACK_HOOK=your_slack_hook_here`
`POST_TO_SLACK=true`

The other value in the `.env` is:

`APP_DEBUG=false`

This can be used to print out various messages during the script's execution.

### Populate Virtualmin pre- and post-backup commands

Look at Example Use below if you just want to get going.

#### Parameters Used

Virtualmin variables:
- `$BACKUP_DEST`
- `$BACKUP_STATUS`

### Example Use

The pre- and post-backup commands are exactly the same.

The purpose of the pre-backup command is to set a start marker which is used by the post-backup command to calculate how long the backup took.

Pre-backup command:
```bash
/bin/bash /root/backup-notifier/notify-slack.sh
```

Post-backup command:
```bash
/bin/bash /root/backup-notifier/notify-slack.sh
```

## Screenshots

### Virtualmin UI

![Alt text](virtualmin_ui_screenshot.png?raw=true "Virtualmin UI / Pre- and Post-Backup Commands")

### Slack UI

![Alt text](virtualmin_slack_notification_screenshot.png?raw=true "Slack Notifications")

## License

MIT

