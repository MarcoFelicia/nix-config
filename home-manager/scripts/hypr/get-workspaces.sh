spaces (){
	WORKSPACES=$(hyprctl workspaces -j)

	LENGTH=$(echo $WORKSPACES | jq 'sort_by(.id) | .[-1].id')
	WORKSPACE_WINDOWS=$(echo $WORKSPACES | jq 'map({key: .id | tostring, value: .windows}) | from_entries')

	seq 1 $(( MAX_WORKSPACE > LENGTH ? MAX_WORKSPACE : LENGTH )) | jq --argjson windows "${WORKSPACE_WINDOWS}" --slurp -Mc 'map(tostring) | map({id: ., windows: ($windows[.]//0)})'
}

spaces
socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
	spaces
done