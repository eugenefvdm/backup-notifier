# Virtualmin Slack Backup Notification

## Description

A Slack Hook notifier designed to work as pre- and post-backup command notifiers for Virtualmin backups

## Installation Instructions

- The only files in this repo needed are `run.sh` an `.env` file which can be copied from `.env.example`
- Copy `run.sh` to any directory, e.g. `/root/backup-notifier`
- Copy `.env.example` to the same directory and rename it `.env`
- Create a new Slack Hook
- Store the Slack Hook URL in an `.env` file
** Double check your credentials **
- Use the Virtualmin UI to populate the the pre- and post-backup commands

### Create a Slack App and get the hook URL

A Slack App is the basic neccesity one needs before being able to use a Slack Hook.<br>
The free plan of Slack comes with 10 Slack Apps.

Follow the Slack instructions here to create a new App:<br>
https://slack.com/intl/en-za/help/articles/115005265063-Incoming-webhooks-for-Slack

### Create a .env file with your newly created Slack hook

Copy .env.example to .env

```Shell
`SLACK_HOOK=your_slack_hook_here`
`POST_TO_SLACK=true`
```

The other value in the `.env` is:

`APP_DEBUG=false`

If this is changed to `true` and then various progress messages will be logged during the script's execution.

## Usage

### Populate Virtualmin pre- and post-backup commands

Look at Example Use below if you just want to get going.

#### Parameters Used

The script reads these two variables which are push to the Shell by Virtualmin:
- `$BACKUP_STATUS`
- `$BACKUP_DEST`

By reading those variables the script can determine if backup was successful, and what the destination was.<br>
The script furthermore will deduce the backup has started and not finished if `$BACKUP_STATUS` is absent.

### Example Use

The pre- and post-backup command syntax is exactly the same. See the Virtualmin UI Screenshot below to see where these commands are added.

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
