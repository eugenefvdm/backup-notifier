## TODO

Are you an open source shell script developer? Please help us make this even more perfect.

Here is our current wish list:

- When the script fails due to non-existing .env file, the following it output:

```bash
Running pre-backup command ..
Begin Batman backup to ssh://backup.vander.host:OQ9Ijpb>Z[6f@backup.vander.host:backup/batman/daily-incr/%Y-%m-%d
/root/notify-slack.sh: 21: source: not found
curl: no URL specified!
curl: try 'curl --help' or 'curl --manual' for more information
.. failed!
```

It would be nice to check if the file is there and if SLACK_HOOK has a value.


- Additional usage instructions for when you have many servers, and how to retrieve the file from Git

yum install git
apt-get install git

```bash
git init
git remote add origin https://github.com/eugenevdm/virtualmin-slack-backup-notification.git
git pull origin main
```

- Instead of outputting `1` or `0` for backup success and fail, use a word such as SUCCESS or FAIL
- Make Slack do something special when it fails, e.g. present the output in the colour red, or play a sound
- Keeping track of backup times is super NB. It would be great that when the verb is read as "begin" (case insensitive) that a timer is created, which is read again afterwards if "end" is encountered

## DONE

~~ Update the readme with a screenshot that shows the Virtualmin UI and where these commands are inputted~~
