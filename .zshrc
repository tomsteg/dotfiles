# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_CUSTOM='$HOME/dotfiles/oh-my-zsh'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sunrise"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-flow-completion node npm bower brew osx extract z docker zsh-autosuggestions tmux)

# User configuration

# <C-x><C-e> mapping command line in editor
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line“

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# php bin
# export PATH="/Applications/MAMP/bin/php/php7.0.22/bin:$PATH"

# mysql
export PATH="/Applications/MAMP/Library/bin:$PATH"

# composer bin
export PATH="$HOME/.composer/vendor/bin:$PATH"

# python
export PATH="/usr/local/lib/python3.5/site-packages:$HOME/Library/Python/3.5/lib/python/site-packages:$PATH"

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

export SVN_EDITOR=nvim

# no more nested nvim
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
	if [ -x "$(command -v nvr)" ]; then
		alias nvim=nvr
	else 
		alias nvim='echo "No nesting nvim!"'
	fi
fi

NPM_PACKAGES=$HOME/.npm-packages
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
PATH="$NPM_PACKAGES/bin:$PATH"

. ~/z.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH="/usr/local/bin:$PATH"

alias cdiCloudDocs="cd $HOME/Library/Mobile\ Documents/27N4MQEA55~pro~writer/Documents"
alias ctags="/usr/local/bin/ctags --exclude=node_modules --exclude=bower_modules --exclude=vendor -R"
alias codi="code-insiders "

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fuzzy commands with fzf
alias fta='tmux attach -t $(tl | fzf | tr ":" "\n" | head -n1)'
alias ftk='tmux kill-session -t $(tl | fzf | tr ":" "\n" | head -n1)'
alias gcorb='gco --track $(git branch -r | fzf)'
alias gcob='gco $(git branch | fzf)'
alias gmb='git merge $(git branch | fzf)'
