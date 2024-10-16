lib: config:
with lib;
with config.custom.theme;
''
  unset zle_bracketed_paste

  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

  ZSH_AUTOSUGGEST_MANUAL_REBIND=ture
  ZSH_AUTOSUGGEST_STRATEGY=(completion)
  ZSH_AUTOSUGGEST_CLEAR_WIDGETS=(accept-line kill-line)
  ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=()
  ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(forward-char)
''
+ (optionalString config.custom.features.bat.enable ''
  alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
  alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

  alias man='batman'
  compdef batman='man'
'')
