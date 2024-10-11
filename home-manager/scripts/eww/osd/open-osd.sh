POS=$(eww get osd_pos_y)
eww open $1 --pos 0x$POS --anchor "bottom center"

eww update current_osd="$1"