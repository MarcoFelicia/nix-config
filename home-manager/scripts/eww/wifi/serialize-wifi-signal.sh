SIGNAL=$1

SIGNAL=$(expr $SIGNAL / 25)

if [ $SIGNAL -gt 3 ]; then
  SIGNAL=3
fi

echo $SIGNAL