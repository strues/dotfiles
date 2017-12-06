# Homebrew Cask directory
export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"
# your project folder that we can `c [tab]` to
export PROJECTS="$HOME/Code"


export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

export PATH="$PATH:/usr/local/opt/openssl/bin:/usr/local/etc/openssl/misc:$PATH"

export PATH="$DOTFILES/bin:$PATH"

export MANPATH="/usr/local/man:/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export GOPATH="$PROJECTS/go"
export PATH="$GOPATH/bin:$PATH"
export PATH="$PATH:/usr/local/sbin:$HOME/bin:/usr/local/go/bin"
export XDG_CACHE_HOME="$HOME/.cache"

export ANDROID_HOME="/Users/steven/Library/Android/sdk"
export GRADLE_HOME="/usr/local/Cellar/gradle/4.3.1"
export GRADLE_USER_HOME="$GRADLE_HOME"
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools


export ZCACHEDIR="$XDG_CACHE_HOME/zsh"
if [[ ! -d "$ZCACHEDIR" ]]; then
  mkdir -p "$ZCACHEDIR"
fi
# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY="$HOME/.node_history"
# Allow 32³ entries; the default is 1000.
export NODE_REPL_HISTORY_SIZE='32768';
# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy';

export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

# Setup terminal, and turn on colors
#export TERM=xterm-256color
export TERM="screen-256color"
export CLICOLOR=1
export LSCOLORS="Gxfxcxdxbxegedabagacad"

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS="-arch x86_64"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

export LESSOPEN="| $(brew --prefix)/bin/src-hilite-lesspipe.sh %s"

less_options=(
  # If the entire text fits on one screen, just show it and quit. (Be more
  # like "cat" and less like "more".)
  --quit-if-one-screen

  # Do not clear the screen first.
  --no-init

  # Like "smartcase" in Vim: ignore case unless the search pattern is mixed.
  --ignore-case

  # Do not automatically wrap long lines.
  --chop-long-lines

  # Allow ANSI colour escapes, but no other escapes.
  --RAW-CONTROL-CHARS

  # Do not ring the bell when trying to scroll past the end of the buffer.
  --quiet

  # Do not complain when we are on a dumb terminal.
  --dumb
);

export LESS="${less_options[*]}"
export PAGER='less'
#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

export TMPPREFIX="${TMPDIR%/}/zsh"

if [[ $IS_MAC -eq 1 ]]; then
    export EDITOR='code'
fi
if [[ $IS_LINUX -eq 1 ]]; then
    export EDITOR='nano'
fi

# Set lang
export LC_ALL="en_US.UTF-8"
export LANG="en_US"


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='code'
fi

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

 # Added by n-install (see http://git.io/n-install-repo).
 # Used instead of nvm
export N_PREFIX="$HOME/.n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"


if (( $+commands[yarn] ))
then
  export PATH="$PATH:`yarn global bin`"
fi
# http://stackoverflow.com/a/23832208/1294213
export PHANTOMJS_CDNURL='http://cnpmjs.org/downloads'

export -U PATH
export -U MANPATH