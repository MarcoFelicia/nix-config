OSD=$(eww get current_osd)
eww update current_osd="$1"

if [ "$OSD" != "$1" ]; then
  eww close $OSD

  POS=$(eww get osd_pos_y)
  eww open $1 --pos 0x$POS --anchor "bottom center"
fi

INCREMENT=$(eww get osd_increment)
INCREMENT=$((INCREMENT+1))
eww update osd_increment="$INCREMENT"

TIMEOUT=$(eww get timeout)
sleep "${TIMEOUT}s" && close-timeout-osd $1 $INCREMENT