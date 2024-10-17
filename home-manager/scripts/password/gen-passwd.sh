prompt() {
  echo -n "$1: "; read -s input
  echo
  echo -n "Confirm $1: "; read -s confirm
  echo
  if [ "$input" != "$confirm" ]; then
    input=
  fi
}

while true; do
  prompt Passphrase
  if [ -n "$input" ]; then
    break
  fi
done
passwd=$input

while true; do
  prompt Length
  if [ -n "$input" ]; then
    break
  fi
done
length=$input

get-hash $passwd $length