wpctl set-mute @DEFAULT_SOURCE@ toggle

MUTE=$(eww get muted)
MUTE=$(expr 1 - $MUTE)
eww update muted="$MUTE"

update-volume

open-osd volume_osd