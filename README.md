# virtualmin-slack-backup-notification

## Description

A Slack Hook notifier designed to work as a Post command hook for Virtualmin Backups

## Usage

First create a Slack hook, store the Slack hook URL, and then populate the Virtualmin post backup command

### Create a Slack App and get the Hook URL

Follow the Slack instructions here to create a new App. A slack App is the basic neccesity one needs before being able to use a hook.

https://slack.com/intl/en-za/help/articles/115005265063-Incoming-webhooks-for-Slack

### Create a .env file with your newly created Slack hook

Copy .env.example to .env

`SLACK_HOOK=your_slack_hook_here`

### Populate Virtualmin post backup command

#### Parameters Used

Your Server Name, e.g.:
- `Superman`

Virtualmin variables:
- `$BACKUP_DEST`
- `$BACKUP_STATUS`

### Example Use

Your pre-backup command should look something like this:

```bash
sh /root/notify-slack.sh Begin Superman $BACKUP_DEST
```

Your post-backup command should look something like this:

```bash
sh /root/notify-slack.sh End Superman $BACKUP_STATUS $BACKUP_DEST
```
