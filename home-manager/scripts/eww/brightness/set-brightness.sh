if [ "$1" = "up" ]; then
  SIGN=""
else
  SIGN="-- -"
fi

busctl --user call rs.wl-gammarelay / rs.wl.gammarelay UpdateBrightness d ${SIGN}${BRIGHTNESS_STEP}

open-timeout-osd brightness_osd