if [ "$1" = "up" ]; then
  SIGN="+"
else
  SIGN="-"
fi

wpctl set-volume -l 1 @DEFAULT_SINK@ $VOLUME_STEP%$SIGN

update-volume

open-popup volume_popup