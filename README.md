# Virtualmin Slack Backup Notification

## Description

A Slack Hook notifier designed to work as pre- and post-backup command notifiers for Virtualmin backups

## Usage

- Copy the file in this repo `notify-slack.sh` to `/root`
- Create a Slack hook
- Store the Slack hook URL in an `.env` file
- Use the Virtualmin UI to populate the the pre- and post-backup commands

### Create a Slack App and get the hook URL

A Slack App is the basic neccesity one needs before being able to use a Slack hook.

Follow the Slack instructions here to create a new App.

https://slack.com/intl/en-za/help/articles/115005265063-Incoming-webhooks-for-Slack

### Create a .env file with your newly created Slack hook

Copy .env.example to .env

`SLACK_HOOK=your_slack_hook_here`

### Populate Virtualmin pre- and post-backup commands

Look at Example Use below if you just want to get going.

#### Parameters Used

A Verb, e.g. `Begin` and `End`

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

## License

MIT

## TODO

Are you an open source shell script developer? Please help us make this even more perfect.

Here is our current wish list:

- Instead of outputting `1` or `0` for backup success and fail, use a word such as SUCCESS or FAIL
- Make Slack do something special when it fails, e.g. present the output in the colour red, or play a sound
- Update the readme with a screenshot that shows the Virtualmin UI and where these commands are inputted
- Keeping track of backup times is super NB. It would be great that when the verb is read as "begin" (case insensitive) that a timer is created, which is read again afterwards if "end" is encountered

## Contact the Author

Eugene van der Merwe
https://vander.host
+27 82 309-6710 (Call or WhatsApp)