## Change Log

26 Auguest 2021

- All command line parameters have been removed greatly reducing the complexity of the script and adding it to many servers

25 August 2021

- Added to README to document APP_DEBUG in `.env`

21 August 2021

- Before `/root` was hardcoded, but it's now dynamically worked out so the application can live anywhere
- The system will now work out how long a backup takes and display the time when finished
- Change source to '.' because on some systems it didn't work.
