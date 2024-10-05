MUTE=$(wpctl get-volume @DEFAULT_SINK@ | grep '[MUTED]')

if [ -z "$MUTE" ]; then
  eww update muted="0"
else
  eww update muted="1"
fi