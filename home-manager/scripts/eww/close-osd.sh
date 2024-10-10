PANEL=$1

LAST=$(eww get osd_increment)
if [ $LAST -eq $2 ]; then
  eww update current_osd=""
  eww close $PANEL
fi