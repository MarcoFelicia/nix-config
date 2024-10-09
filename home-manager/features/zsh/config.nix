lib: config:
with lib;
with config.custom.theme;
''
  unset zle_bracketed_paste

  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

  ZSH_AUTOSUGGEST_MANUAL_REBIND=ture
  ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)
  ZSH_AUTOSUGGEST_CLEAR_WIDGETS=(accept-line kill-line)
  ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=()
  ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(forward-char)

  function delete_failed_command() {
    local CODE=$?
    if [[ $CODE -ne 0 ]]; then
      fc -W

      local TEMP_FILE=/tmp/zsh_hist
      local HIST=$(cat $HISTFILE)
      
      print -z "$(echo $HIST | tail -n 1)"
      echo $HIST | head -n -1 > $TEMP_FILE
      cat $TEMP_FILE > $HISTFILE

      rm $TEMP_FILE
      fc -R
    fi
  }

  typeset -a precmd_functions
  precmd_functions+=(delete_failed_command)
''
+ (optionalString config.custom.features.bat.enable ''
  alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
  alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

  alias -g man='batman'
  compdef batman='man'
'')
