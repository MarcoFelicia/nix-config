if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "$WALLPAPER_DIR does not exist"
    exit 1
fi

CONFIG_DIR="$HOME/.config/hypr/hyprpaper.conf"
CONFIG="ipc=on\nsplash=false\n"
while read -r line; do
    if [[ $line =~ ^preload= ]]; then
        LAST=$(echo $line | grep -E '[A-Za-z0-9\-]*\.(jpg|png)' -o)
        break
    fi
done < $CONFIG_DIR

cd $WALLPAPER_DIR

FILES=()
for i in *; do
    FILES+=($i)
done

LEGNTH=${#FILES[@]}
if [ $LEGNTH -eq 1 ]; then
    IMG=$FILES
else
    suffle() {
        IMG=$(printf "%s\n" "${FILES[@]}" | shuf -n 1)
    }
    suffle
    while [ "$IMG" = "$LAST" ]; do
        suffle
    done
fi

MONITOR=$(hyprctl monitors | grep Monitor | awk '{print $2}')
DIR="$WALLPAPER_DIR/$IMG"

CONFIG="${CONFIG}preload=$DIR\nwallpaper=$MONITOR,$DIR\n"

printf $CONFIG > $CONFIG_DIR

hyprctl hyprpaper preload $DIR
hyprctl hyprpaper wallpaper "$MONITOR, $DIR"