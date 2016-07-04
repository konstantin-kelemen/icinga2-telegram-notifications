#!/bin/bash

#Spliting the USERPAGER variable into two: APIKEY and CHATID
arrUSERPAGER=(${USERPAGER//|/ })
APIKEY=${arrUSERPAGER[0]}
CHATID=${arrUSERPAGER[1]}

#The message
MESSAGE="*$NOTIFICATIONTYPE $HOSTALIAS/$SERVICEDESC is $SERVICESTATE*

*Notification Type*: $NOTIFICATIONTYPE
*Service*: $SERVICEDESC
*Host*: $HOSTALIAS
*Address*: $HOSTADDRESS
*State*: $SERVICESTATE
*Date/Time*: $LONGDATETIME
*Additional Info*: $SERVICEOUTPUT
*Comment*: [$NOTIFICATIONAUTHORNAME] $NOTIFICATIONCOMMENT"

#Pushing it!
curl --silent \
--data-urlencode "chat_id=$CHATID" \
--data-urlencode "text=$MESSAGE" \
--data-urlencode "parse_mode=Markdown" \
"https://api.telegram.org/bot$APIKEY/sendMessage"
