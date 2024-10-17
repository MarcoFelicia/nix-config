echo -n "Passphrase: "; read -s passwd
echo
echo -n "Length: "; read -s length
echo

get-hash $passwd $length && sleep $CLIP_TIME && wl-copy "" &