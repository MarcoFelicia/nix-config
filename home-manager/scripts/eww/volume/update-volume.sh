VOLUME=$(wpctl get-volume @DEFAULT_SINK@ | awk -F': ' '{print $2}' | awk '{print $1*100}')
eww update volume="$VOLUME"