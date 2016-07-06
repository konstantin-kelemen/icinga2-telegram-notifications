#!/bin/bash

#Spliting the USERPAGER variable into two: APIKEY and CHATID
arrUSERPAGER=(${USERPAGER//|/ })
APIKEY=${arrUSERPAGER[0]}
CHATID=${arrUSERPAGER[1]}

#The message
MESSAGE="<b>$NOTIFICATIONTYPE $HOSTALIAS is $HOSTSTATE</b>

<b>Host</b>: $HOSTALIAS
<b>Address</b>: $HOSTADDRESS
<b>State</b>: $HOSTSTATE
<b>Date/Time</b>: $LONGDATETIME
<b>Additional Info</b>: $HOSTOUTPUT
<b>Comment</b>: [$NOTIFICATIONAUTHORNAME] $NOTIFICATIONCOMMENT"

#Pushing it!
curl --silent \
--data-urlencode "chat_id=$CHATID" \
--data-urlencode "text=$MESSAGE" \
--data-urlencode "parse_mode=HTML" \
"https://api.telegram.org/bot$APIKEY/sendMessage"
