
# Execute code that does not affect the current session in the background.
  # Compile the completion dump to increase startup speed.
  local zcompdump="$ZCACHEDIR/zcompdump"

  
  autoload -Uz compinit && compinit -C -d "${zcompdump}"

  {
    # Compile the completion dump to increase startup speed.
    if [[ -s "${zcompdump}" && (! -s "${zcompdump}.zwc" || "${zcompdump}" -nt "${zcompdump}.zwc") ]]; then
      zcompile "${zcompdump}"
    fi
  } &!