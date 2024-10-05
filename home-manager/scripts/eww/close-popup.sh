PANEL=$1

LAST=$(eww get popup_increment)
if [ $LAST -eq $2 ]; then
  eww update current_popup=""
  eww close $PANEL
fi