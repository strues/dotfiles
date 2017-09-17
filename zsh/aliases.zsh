# -------------------------------------------------------------------
# Copies public key to the clipboard
# -------------------------------------------------------------------

alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"


# -------------------------------------------------------------------
# Remote connections
# -------------------------------------------------------------------
alias vps="ssh root@172.82.190.66 -p 2118"
alias seedbox="ssh root@148.251.182.19 -p 2118"

# -------------------------------------------------------------------
# Git
# -------------------------------------------------------------------
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'

# Remove `+` and `-` from start of diff lines; just rely upon color.
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'

alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias gac='git add -A && git commit -m'
alias ge='git-edit-new'

# -------------------------------------------------------------------
# directory movement
# -------------------------------------------------------------------
alias 'bk=cd $OLDPWD'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'


# directory shortcuts
alias projects='~/Code/'
alias Code="~/Code/"
alias github='~/Code/github.com/'

# -------------------------------------------------------------------
# Randomness
# -------------------------------------------------------------------

alias 'ttop=top -ocpu -R -F -s 2 -n30' # fancy top
alias 'rm=rm -i' # make rm command (potentially) less destructive

# Force tmux to use 256 colors
alias tmux='TERM=screen-256color-bce tmux'

# alias to cat this file to display
alias acat='< $DOTFILES/zsh/aliases.zsh'
alias fcat='< $DOTFILES/zsh/functions.zsh'


# Just for fun
alias please='sudo !!'
alias fail='tail -f'

# alias to cat this file to display
alias acat='< ~/.dotfiles/zsh/aliases.zsh'

alias reload='source ~/.zshrc'
alias ltd='ls *(m0)' # files & directories modified in last day
alias lt='ls *(.m0)' # files (no directories) modified in last day
alias lnew='ls *(.om[1,3])' # list three newest

# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# -------------------------------------------------------------------
# Node Stuff
# -------------------------------------------------------------------
alias nis='npm install --save'
alias nisd='npm install --save-dev'
alias nig='npm install -g'
alias yr='yarn run'

# -------------------------------------------------------------------
# Docker
# -------------------------------------------------------------------
alias dc='docker-compose'
alias dcud='docker-compose up -d'


# -------------------------------------------------------------------
# Mac Stuff
# -------------------------------------------------------------------

alias ql='qlmanage -p 2>/dev/null' # OS X Quick Look
alias oo='open .' # open current directory in OS X Finder
# alias to show all Mac App store apps
alias apps='mdfind "kMDItemAppStoreHasReceipt=1"'
# reset Address Book permissions in Mountain Lion (and later presumably)
alias resetaddressbook='tccutil reset AddressBook'
# refresh brew by upgrading all outdated casks
alias refreshbrew='brew outdated | while read cask; do brew upgrade $cask; done'
# rebuild Launch Services to remove duplicate entries on Open With menu
alias rebuildopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias defhist='history 1 | grep "defaults"'

# -------------------------------------------------------------------
# Networking. IP address, dig, DNS
# -------------------------------------------------------------------

alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias dig="dig +nocmd any +multiline +noall +answer"
# Flush DNS cache
alias flushdns="dscacheutil -flushcache"
# View HTTP traffic
alias sniff="sudo ngrep -W byline -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"


# -------------------------------------------------------------------
# Mac Stuff
# -------------------------------------------------------------------

alias ql='qlmanage -p 2>/dev/null' # OS X Quick Look
alias oo='open .' # open current directory in OS X Finder
# alias to show all Mac App store apps
alias apps='mdfind "kMDItemAppStoreHasReceipt=1"'
# reset Address Book permissions in Mountain Lion (and later presumably)
alias resetaddressbook='tccutil reset AddressBook'
# refresh brew by upgrading all outdated casks
alias refreshbrew='brew outdated | while read cask; do brew upgrade $cask; done'
# rebuild Launch Services to remove duplicate entries on Open With menu
alias rebuildopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias defhist='history 1 | grep "defaults"'
# Update installed Ruby gems, Homebrew, npm, and their installed packages
alias brew_update="brew -v update; brew upgrade --force-bottle --cleanup; brew cleanup; brew cask cleanup; brew prune; brew doctor; npm-check -g -u"
alias update_brew_npm_gem='brew_update; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update --no-document'


# -------------------------------------------------------------------
# directory information
# -------------------------------------------------------------------

alias lh='ls -d .*' # show hidden files/directories only
alias lsd='ls -aFhlG'
alias l='ls -al'
alias ls='ls -GFh' # Colorize output, add file type indicator, and put sizes in human readable format
alias ll='ls -GFhl' # Same as above, but in long listing format

alias lsd="ls -ld *" # show directories
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias 'dirdus=du -sckx * | sort -nr' #directories sorted by size
alias 'dus=du -kx | sort -nr | less' #files sorted by size

alias 'wordy=wc -w * | sort | tail -n10' # sort files in current directory by the number of words they contain
alias 'filecount=find . -type f | wc -l' # number of files (not directories)

# these require zsh
alias ltd='ls *(m0)' # files & directories modified in last day
alias lt='ls *(.m0)' # files (no directories) modified in last day
alias lnew='ls *(.om[1,3])' # list three newest

if [ "$(uname -s)" != "Darwin" ]; then
  if [ -z "$(command -v pbcopy)" ]; then
    if [ -n "$(command -v xclip)" ]; then
      alias pbcopy="xclip -selection clipboard"
      alias pbpaste="xclip -selection clipboard -o"
    elif [ -n "$(command -v xsel)" ]; then
      alias pbcopy="xsel --clipboard --input"
      alias pbpaste="xsel --clipboard --output"
    fi
  fi
  if [ -e /usr/bin/xdg-open ]; then
    alias open="xdg-open"
  fi
fi

# greps non ascii chars
nonascii() {
  LANG=C grep --color=always '[^ -~]\+';
}

# HTTP Requests. One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done