CACHE_DIR="$HOME/.cache/sunrisesunset.txt"

function fetch(){
  local JSON=$(curl -s 'https://api.sunrisesunset.io/json?lat=52&lng=-2&time_format=24')
  SUNRISE=$(echo $JSON | jq '.results.sunrise' | awk '{print $1}' | sed -e "s/[:\"]//g")
  SUNSET=$(echo $JSON | jq '.results.sunset' | awk '{print $1}' | sed -e "s/[:\"]//g")
  
  local DATE=$(date +%D)
  echo "$DATE $SUNRISE $SUNSET" > $CACHE_DIR
}

HAS_CACHE=false
if [ -e $CACHE_DIR ]; then
  CACHE=$(cat $CACHE_DIR) 
  if [ -n "$CACHE" ]; then
    set $CACHE
    if [ $# -eq 3 ]; then
      if [ "$1" == $(date +%D) ]; then
        SUNRISE=$2
        SUNSET=$3
        HAS_CACHE=true
        echo cache
      fi
    fi
  fi
fi

if ! $HAS_CACHE; then
  fetch
  echo fetch
fi

TIME=$(date +%X | sed -e "s/://g")

if [ $TIME -gt $SUNRISE -a $TIME -lt $SUNSET ]; then
  day-mode
else
  night-mode
fi

sleep $DAY_NIGHT_UPDATE_INTERVAL && $0
