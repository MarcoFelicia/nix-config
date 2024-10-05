PANEL=$(eww get current_popup)
eww update current_popup="$1"

if [ "$PANEL" != "$1" ]; then
  eww close $PANEL

  POS=$(eww get popup_pos_y)
  eww open $1 --pos 0x$POS --anchor "bottom center"
fi

INCREMENT=$(eww get popup_increment)
INCREMENT=$((INCREMENT+1))
eww update popup_increment="$INCREMENT"

TIMEOUT=$(eww get timeout)
sleep "${TIMEOUT}s" && close-popup $1 $INCREMENT