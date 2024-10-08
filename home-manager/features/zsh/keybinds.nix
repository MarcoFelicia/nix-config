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
  function zvm_after_init() {
    bindkey -rp '''
    bindkey -R ' '-'~' self-insert

    ${disable_keys}
    
    bindkey '^M' accept-line
    bindkey '^?' backward-delete-char
    bindkey '^[[3~' delete-char
    bindkey '^[[A' up-line-or-history
    bindkey '^[[B' down-line-or-history

    zvm_bindkey vicmd '\e' zvm_enter_insert_mode
    zvm_bindkey viins '\e' zvm_exit_insert_mode
    zvm_bindkey visual '\e' zvm_exit_visual_mode
    zvm_bindkey vicmd 'i'  zvm_enter_insert_mode
    zvm_bindkey vicmd 'v' zvm_enter_visual_mode

    bindkey -M viins '^I' autosuggest-accept
    bindkey '^L' erase-screen
  }

  zvm_after_init_commands+=(zvm_after_init)
''
