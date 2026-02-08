LANG="en_US.UTF-8"
DEFAULT_USER=`whoami`

# Fix resetting title after ssh sessions
export PROMPT_COMMAND="echo -ne '\033]0;\007';$PROMPT_COMMAND"
precmd() { eval "$PROMPT_COMMAND" }


# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# git
alias g='git'
alias ggpush='git push --set-upstream origin $(git symbolic-ref --short HEAD)'

# Additional git config
if [ -d "$HOME/projects/jimdo" ]; then
  source "$HOME/projects/jimdo/.zshconfig"
fi


# Folder commands
project () { cd ~/projects/$1 }
compdef '_files -W ~/projects -/' project
alias p='project'

studies () { cd ~/studies/$1 }
compdef '_files -W ~/studies/ -/' studies
alias s='studies'


##################################
# Homebrew
##################################

# Use Apple Silicon homebrew
export PATH="/opt/homebrew/bin:$PATH"
# Do not auto update brew packages
export HOMEBREW_NO_AUTO_UPDATE=1
# export HOMEBREW_GITHUB_API_TOKEN=ghp_gibberish
# Use Homebrew OpenSSL with Ruby
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
# Use Homebrew sqlite3
export PATH="$(brew --prefix sqlite)/bin:$PATH"


##################################
# asdf
##################################

# Inititalize asdf version manager
if [ -x "$(which asdf)" ]; then
  . $(brew --prefix asdf)/libexec/asdf.sh
fi


##################################
# Extra binaries
##################################
# Add local bin to path
export PATH="$HOME/.local/bin:$PATH"
# Add yarn global bin to path
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# Use Postgres.app psql
# export PATH="/Applications/Postgres.app/Contents/Versions/9.6/bin:$PATH"
# libpq on Apple Silicon
export PATH="$(brew --prefix libpq)/bin:$PATH"


##################################
# Ruby / Rails
##################################
# Ruby Alias
alias rs='rails server'
alias rc='rails console'

# Use rails-specific binstubs
# export PATH="./bin:$PATH"

# Rails error pages
export RAILS_EDITOR="code"

# Disable fork safety for Ruby on Apple Silicon
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Use ~/.webdrivers chromedriver
export PATH=~/.webdrivers:$PATH


##################################
# Python
##################################
# Use brew python3 as default
# export PATH="$(brew --prefix python@3)/libexec/bin:$PATH"

# Python Alias
# alias py='python3'
# alias python='python3'
# alias pip='pip3'

# Enable uv env
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"
export UV_ENV_FILE=.env


##################################
# Go
##################################
# infra-monitoring
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix go)/libexec"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin


# Heroku deploy Alias
# heroku() {
#   if [[ $@ == "deploy" ]]; then
#     command git push heroku main
#   else
#     command heroku "$@"
#   fi
# }


# Skip node trying to install chromium
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`
