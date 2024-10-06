''
  zvm_bindkey viins '^I' autosuggest-accept

  cls() {
    clear
    zle accept-line
  }
  zle -N cls
  zvm_after_init_commands+=('{
    bindkey "'^L'" cls; 
  }')
''
