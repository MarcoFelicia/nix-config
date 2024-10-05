NIGHT_MODE=$(eww get night_mode)

if [ $NIGHT_MODE -eq 0 ]; then
  night-mode
else
  day-mode
fi

NIGHT_MODE=$(expr 1 - $NIGHT_MODE)
eww update night_mode="$NIGHT_MODE"