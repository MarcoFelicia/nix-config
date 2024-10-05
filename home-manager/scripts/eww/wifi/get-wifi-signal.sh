SSID=$(get-wifi-name)
SIGNAL=$(nmcli -t -f SSID,SIGNAL dev wifi | grep "^$SSID:" | awk -F':' '{print $2}')

serialize-wifi-signal $SIGNAL