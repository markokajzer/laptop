LANG="en_US.UTF-8"
DEFAULT_USER=`whoami`

# Fix resetting title after ssh sessions
export PROMPT_COMMAND="echo -ne '\033]0;\007';$PROMPT_COMMAND"
precmd() { eval "$PROMPT_COMMAND" }


# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# git Alias
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


# Ruby
# Inititalize rbenv
if [ -x "$(command -v rbenv)" ]; then
  eval "$(rbenv init -)"
fi

# Use Homebrew OpenSSL with Ruby
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# Ruby Alias
alias rb='ruby'
alias rs='rails server'
alias rc='rails console'

# Use rails-specific binstubs
export PATH="./bin:$PATH"


# Initialize nodenv
if [ -x "$(command -v nodenv)" ]; then
  eval "$(nodenv init -)"
fi


# Python
# Use brew python3 as default
# export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Python Alias
alias py='python3'
# alias python='python3'
# alias pip='pip3'


# Use Homebrew sqlite3
export PATH="$(brew --prefix sqlite)/bin:$PATH"

# Use Postgres.app psql
# export PATH="/Applications/Postgres.app/Contents/Versions/9.6/bin:$PATH"


# Heroku deploy Alias
# heroku() {
#   if [[ $@ == "deploy" ]]; then
#     command git push heroku master
#   else
#     command heroku "$@"
#   fi
# }

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
