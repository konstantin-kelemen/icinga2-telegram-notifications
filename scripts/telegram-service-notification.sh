#!/bin/bash

#Spliting the USERPAGER variable into two: APIKEY and CHATID
arrUSERPAGER=(${USERPAGER//|/ })
APIKEY=${arrUSERPAGER[0]}
CHATID=${arrUSERPAGER[1]}

#The message
MESSAGE="<b>$NOTIFICATIONTYPE $HOSTALIAS/$SERVICEDESC is $SERVICESTATE</b>

<b>Notification Type</b>: $NOTIFICATIONTYPE
<b>Service</b>: $SERVICEDESC
<b>Host</b>: $HOSTALIAS
<b>Address</b>: $HOSTADDRESS
<b>State</b>: $SERVICESTATE
<b>Date/Time</b>: $LONGDATETIME
<b>Additional Info</b>: $SERVICEOUTPUT
<b>Comment</b>: [$NOTIFICATIONAUTHORNAME] $NOTIFICATIONCOMMENT"

#Pushing it!
curl --silent \
--data-urlencode "chat_id=$CHATID" \
--data-urlencode "text=$MESSAGE" \
--data-urlencode "parse_mode=HTML" \
"https://api.telegram.org/bot$APIKEY/sendMessage"
