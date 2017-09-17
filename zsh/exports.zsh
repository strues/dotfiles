# Homebrew Cask directory
export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"
# your project folder that we can `c [tab]` to
export PROJECTS=$HOME/Code


export PATH="$PATH:/usr/local/opt/openssl/bin:/usr/local/etc/openssl/misc:$PATH"
export PATH=$DOTFILES/bin:$PATH;

export MANPATH="/usr/local/man:$MANPATH"
export GOPATH=$PROJECTS/go
export PATH="$GOPATH/bin:$PATH"
export PATH=$PATH:/usr/local/sbin:$HOME/bin:/usr/local/go/bin

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

# Setup terminal, and turn on colors
#export TERM=xterm-256color
export TERM=screen-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS="-arch x86_64"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Make less the default pager, add some options and enable syntax highlight using source-highlight
LESSPIPE=`which src-hilite-lesspipe.sh`
[ -n "$LESSPIPE" ] && export LESSOPEN="| ${LESSPIPE} %s"
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
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

if (( $+commands[yarn] ))
then
  export PATH="$PATH:`yarn global bin`"
fi
