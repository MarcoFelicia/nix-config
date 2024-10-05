TEMP_BRIGHTNESS=$(busctl --user -- get-property rs.wl-gammarelay / rs.wl.gammarelay Brightness | awk '{print $2}')

echo $TEMP_BRIGHTNESS > /tmp/hypridle.txt

busctl --user set-property rs.wl-gammarelay / rs.wl.gammarelay Brightness d $IDLE_BRIGHTNESS;
