''
  zmodload zsh/complist
  autoload -U compinit && compinit

  zstyle ':completion:*' use-cache on
  zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

  zstyle ':completion:*' menu select
''
