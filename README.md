# icinga2-telegram-notifications

Telegram notification scripts for Icinga 2 with useful code snippets

## How to use:

Copy the provided .sh files to your Icinga2/scripts directory.

Merge the contents of the config files in conf.d with those you have.

Take a closer look at the notifications.conf, by default the notifications are sent to users in the "noc" group.

In case you use Director plugin for Icinga Web 2 you should do the following steps to make this work:

Create a group:
![Group settings](http://i.imgur.com/Ln2WCa4.png)

Create a user template:
![User template](http://i.imgur.com/QqbS8SP.png)

Create a user and specify your Telegram bot API key and your chat ID with a vertical line between them in the Pager field:
![User settings](http://i.imgur.com/3IwxTxE.png)

Delpoy your config and you're done!