KNOWN=$(nmcli -t -f NAME,TYPE connection show | grep ':802-11-wireless' | awk -F':' '{print $1}')

LIST=$(nmcli -t -f SSID,SIGNAL dev wifi)
JSON="["

for i in $LIST; do
  NAME=$(echo $i | awk -F':' '{print $1}')
  SIGNAL=$(echo $i | awk -F':' '{print $2}')
  SIGNAL=${SIGNAL:-0}

  SIGNAL=$(serialize-wifi-signal $SIGNAL)

  if [ -n "$NAME" ]; then
    FIND=$(echo $KNOWN | grep -E "[ ]?$NAME[ ]?")
    CONNECT=true
    if [ ${#FIND} -eq 0 ]; then
      CONNECT=false
    fi

    JSON="$JSON{\"name\":\"$NAME\",\"signal\":$SIGNAL,\"connect\":$CONNECT},"
  fi
done

echo ")echo $JSON | awk '{print substr($1,0,(length($1)-1))}')]" | jq 'sort_by(.signal) | reverse'