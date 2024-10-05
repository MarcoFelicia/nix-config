SSID=$(nmcli -t -f ACTIVE,SSID dev wifi | awk -F':' '$1=="yes" {print $2}')

if [[ -z "$SSID" ]]; then
    echo ""
else
    echo "$SSID"
fi