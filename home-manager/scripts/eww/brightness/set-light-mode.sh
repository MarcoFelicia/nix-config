FETCH=$(curl 'https://api.sunrisesunset.io/json?lat=52&lng=-2&time_format=24')

SUNRISE=$(echo $FETCH | jq '.results.sunrise' | awk '{print $1}' | sed -e "s/[:\"]//g")
SUNSET=$(echo $FETCH | jq '.results.sunset' | awk '{print $1}' | sed -e "s/[:\"]//g")

TIME=$(date +%X | sed -e "s/://g")

if [ $TIME -gt $SUNRISE -a $TIME -lt $SUNSET ]; then
  day-mode
else
  night-mode
fi
