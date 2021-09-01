# Virtualmin Slack Backup Notification

## Description

A Slack Hook notifier designed to work as pre- and post-backup command notifiers for Virtualmin backups

## Usage

- The only files in this repo needed are `run.sh` an `.env` file copied from the .env.example file
- Copy `run.sh` to any directory, e.g. `/root/backup-notifier`
- Copy `.env.example` to the same directory and rename it `.env`
- Create a new Slack Hook
- Store the Slack Hook URL in an `.env` file
** Double check your credentials **
- Use the Virtualmin UI to populate the the pre- and post-backup commands

### Create a Slack App and get the hook URL

A Slack App is the basic neccesity one needs before being able to use a Slack Hook.
The free plan of Slack comes with 10 Slack Apps.

Follow the Slack instructions here to create a new App:
https://slack.com/intl/en-za/help/articles/115005265063-Incoming-webhooks-for-Slack

### Create a .env file with your newly created Slack hook

Copy .env.example to .env

`SLACK_HOOK=your_slack_hook_here`
`POST_TO_SLACK=true`

The other value in the `.env` is:

`APP_DEBUG=false`

This can be changed to `true` and then various progress messages will be logged during the script's execution.

### Populate Virtualmin pre- and post-backup commands

Look at Example Use below if you just want to get going.

#### Parameters Used

The script read these variables which are push to the Shell by Virtualmin:
- `$BACKUP_DEST`
- `$BACKUP_STATUS`

### Example Use

The pre- and post-backup command syntax is exactly the same.

The purpose of the pre-backup command is to set a start marker which is used by the post-backup command to calculate how long the backup took.

Pre-backup command:
```bash
/bin/bash /root/backup-notifier/run.sh
```

Post-backup command:
```bash
/bin/bash /root/backup-notifier/run.sh
```

## Screenshots

### Virtualmin UI

![Alt text](docs/images/virtualmin_ui_screenshot.png?raw=true "Virtualmin UI / Pre- and Post-Backup Commands")

### Slack UI

![Alt text](docs/images/virtualmin_slack_notification_screenshot.png?raw=true "Slack Notifications")

## License

MIT

This sofware is open-sourced software licensed under the MIT license.
