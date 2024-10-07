busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Brightness d $NIGHT_BRIGHTNESS
busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q $NIGHT_TEMPERATURE

eww update night_mode="1"