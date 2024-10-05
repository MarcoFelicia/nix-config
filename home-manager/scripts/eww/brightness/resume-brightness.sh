BRIGHTNESS=$(</tmp/hypridle.txt)

busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Brightness d $BRIGHTNESS