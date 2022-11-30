#!/bin/bash
input="/home/agungsurya/bot-cekwebsite-ter-fix-27-09-2022/terbaru/domain.txt"
protokol='https://'
while IFS= read -r line; do
    # curl --write-out %{http_code} --silent --output /dev/null -L $line
    #curl -A "Bot_agungsurya/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Bot/59.0" http://localhost
      status_code=$(curl --connect-timeout 180  --write-out %{http_code} --silent --output /dev/null -A "Bot_website_check/5.0 (Ubuntu Server 20.04.4 at 172.16.121.134; x86; x64; rv:59.0) Gecko/20100101 Bot/59.0" -L ${protokol}${line})
      sleep $[ ( $RANDOM % 3 )  + 1 ]s
       if [[ "$status_code" -ne 200 ]] && [[ "$status_code" -ne 302 ]]; then
#       curl -X POST -H 'Content-Type: application/json' -d '{"chat_id": "", "text": $(line) is down $(status_code), "disable_notification": true}'  https://api.telegram.org/bot78672364726472364237gdsdnuciyuidgdcnedcecsmgmekxduxesgnxgs/sendMessage
       curl  --silent --output /dev/null -X POST  -H 'Content-Type: application/json' -d '{"chat_id": "7864872648236487236", "text":"'"${line} : status_code : ${status_code}"'", "disable_notification": true }' https://api.telegram.org/bot682364872548235467gdjkadgbcadawgcdagdnuecgufym/sendMessage | echo "${line} is down!" 
       else
       echo "${line} is running!" 
       fi

done < "$input"
