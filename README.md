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

The other value in the `.env` is:

`APP_DEBUG=false`

It's sole purpose is to stop Slack notifications from being sent.

### Populate Virtualmin pre- and post-backup commands

Look at Example Use below if you just want to get going.

#### Parameters Used

A Verb, e.g. `Begin` and `End`

Your Server Name, e.g.:
- `Batman`

Virtualmin variables:
- `$BACKUP_DEST`
- `$BACKUP_STATUS`

### Example Use

In the examples below, the server name is `Batman`.


Your pre-backup command should look something like this:
```bash
sh /root/backup-notifier/notify-slack.sh Begin Batman $BACKUP_DEST
```

Your post-backup command should look something like this:
```bash
sh /root/backup-notifier/notify-slack.sh End Batman $BACKUP_DEST $BACKUP_STATUS
```

## Screenshots

### Virtualmin UI

![Alt text](virtualmin_ui_screenshot.png?raw=true "Virtualmin UI / Pre- and Post-Backup Commands")

### Slack UI

![Alt text](virtualmin_slack_notification_screenshot.png?raw=true "Slack Notifications")

## License

MIT

