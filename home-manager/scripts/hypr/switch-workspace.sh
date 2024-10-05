ACTIVE=$(hyprctl activeworkspace -j)

if [ $(echo $ACTIVE | jq '.id') = "1" ] && [ "$1" = "-" ]; then
    hyprctl dispatch workspace e"$1"1
    exit
fi

if [ $(echo $ACTIVE | jq '.windows') = "0" ]; then
    hyprctl dispatch workspace e"$1"1
else
    hyprctl dispatch workspace "$1"1
fi