lib:
with lib;
let
  disable_keys = concatStringsSep "\n" (
    map (key: "bindkey -s '${key}' '\\a'") [
      # home end
      "^[[2~"
      "^[[H"
      # arrow keys
      "^[[F"
      "^[[A"
      "^[[B"
      "^[[C"
      "^[[D"
      "^[[1;5A"
      "^[[1;5B"
      "^[[1;5C"
      "^[[1;5D"
      # f keys
      "^[OP"
      "^[OQ"
      "^[OR"
      "^[OS"
      "^[[15~"
      "^[[17~"
      "^[[18~"
      "^[[19~"
      "^[[20~"
      "^[[21~"
      "^[[23~"
      "^[[24~"
      # print
      "^[[57361u"
    ]
  );
in
''
  KEYTIMEOUT=1

  bindkey -rp '''
  bindkey -R ' '-'~' self-insert

  ${disable_keys}

  bindkey '^M' accept-line
  bindkey '^?' backward-delete-char
  bindkey '^H' backward-delete-word
  bindkey '^[[3~' delete-char
  bindkey '^[[3;5~' delete-word
  bindkey '^[[A' up-line-or-history
  bindkey '^[[B' down-line-or-history
  bindkey "^[[C" forward-char
  bindkey "^[[D" backward-char
  bindkey "^[[1;5C" forward-word
  bindkey "^[[1;5D" backward-word
  bindkey "^K" backward-kill-line

  bindkey '^I' autosuggest-accept
  bindkey '^L' erase-screen
''
