export DOTFILES=$HOME/.dotfiles
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.dotfiles/oh-my-zsh

source $DOTFILES/zsh/checks.zsh
source $DOTFILES/zsh/colors.zsh

source $ZSH/themes/spaceship.zsh-theme

ZSH_THEME="spaceship"
CASE_SENSITIVE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_TITLE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Autosuggestions + Substring search config
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-substring-search-up history-substring-search-down)

plugins=(z git alias-tips thefuck brew node npm history zsh-nvm zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source $ZSH/plugins/history-substring-search/history-substring-search.zsh
source $ZSH_CUSTOM/plugins/alias-tips/alias-tips.plugin.zsh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# =====================================================================================================================
# Plugin bindings
# =====================================================================================================================
source $DOTFILES/zsh/completion.zsh
source $DOTFILES/zsh/history.zsh
source $DOTFILES/zsh/bindkeys.zsh

# =====================================================================================================================
# Functions
# =====================================================================================================================

source $DOTFILES/zsh/functions.zsh

# =====================================================================================================================
# Exports
# =====================================================================================================================

source $DOTFILES/zsh/exports.zsh
source $DOTFILES/zsh/fzf.zsh

source $DOTFILES/zsh/setopt.zsh
source $DOTFILES/zsh/aliases.zsh
# =====================================================================================================================
# Hooks
# =====================================================================================================================
source $DOTFILES/zsh/zsh_hooks.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# npm tab completion
. <(npm completion)

# Stash your environment variables in ~/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts.
if [[ -a $HOME/.zprofile ]]
then
  source $HOME/.zprofile
fi