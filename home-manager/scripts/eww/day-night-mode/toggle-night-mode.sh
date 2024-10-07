NIGHT_MODE=$(eww get night_mode)

if [ $NIGHT_MODE -eq 0 ]; then
  night-mode
else
  day-mode
fi