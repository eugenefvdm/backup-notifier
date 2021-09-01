## TODO

Are you an open source shell script developer? Please help us make this even more perfect.

Here is our current wish list:

### 1 September 2021

- Fix screenshots, both are outdated
- When the `DEBUG=` variable in `.env` is omitted, the script shows warnings. These do not affect anything but it would be better to check if `DEBUG=` exist first, and then assign a local variable.

### Older

- New .env variable, POST_TO_SLACK_ON_START. This would be used to reduce noise in the system and should be off by default.
- If the user omits the start script, it would be nice to still show completion without duration [REPEAT]
- A system that only display on failure is more powerful, one that says start of backup just creates noise
- If it's the backup job's end, and there is no start marker, avoid trying to calculate the time
- Additional usage instructions for when you have many servers, and how to retrieve the file from Git. The problem with the current method is everything goes to a root directory possibly polluting that root with screenshots and all kinds of unneccesary things

git clone https://github.com/eugenevdm/backup-notifier
cd backup-notifier

yum install git
apt-get install git

```bash
git init
git remote add origin https://github.com/eugenevdm/backup-notifier.git
git pull origin main
```

### DONE

~~ Update the readme with a screenshot that shows the Virtualmin UI and where these commands are inputted~~
~~ Instead of outputting `1` or `0` for backup success and fail, use a word such as SUCCESS or FAIL ~~
~~ Keeping track of backup times is super NB. It would be great that when the verb is read as "begin" (case insensitive) that a timer is created, which is read again afterwards if "end" is encountered ~~
~~ The hostname should be read instead of begin a variable ~~
~~ - When the script fails due to non-existing .env file, the following it output:

```bash
Running pre-backup command ..
Begin Batman backup to ssh://backup.vander.host:OQ9Ijpb>Z[6f@backup.vander.host:backup/batman/daily-incr/%Y-%m-%d
/root/notify-slack.sh: 21: source: not found
curl: no URL specified!
curl: try 'curl --help' or 'curl --manual' for more information
.. failed!
```

- It would be nice to check if the file is there and if SLACK_HOOK has a value.
~~ The script should be renamed, something like 'backup_notifier' ~~
~~ notify-slack.sh should be something like run.sh ~~
~~ Make Slack do something special when it fails, e.g. present the output in the colour red, or play a sound ~~