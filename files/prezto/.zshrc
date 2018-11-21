LANG="en_US.UTF-8"
DEFAULT_USER=`whoami`

# Fix resetting title after ssh sessions
export PROMPT_COMMAND="echo -ne '\033]0;\007';$PROMPT_COMMAND"
precmd() { eval "$PROMPT_COMMAND" }


# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Inititalize rbenv
if [ -x "$(command -v rbenv)" ]
  then eval "$(rbenv init -)"
fi

# Initialize nodenv
eval "$(nodenv init -)"


# Use Homebrew sqlite3
export PATH="$(brew --prefix sqlite)/bin:$PATH"

# Use brew python2
export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"

# Use Postgres.app psql
# export PATH="/Applications/Postgres.app/Contents/Versions/9.6/bin:$PATH"

# Use rails-specific binstubs
export PATH="./bin:$PATH"


# Ruby Alias
alias rb='ruby'
alias rs='bin/rails server'
alias rc='bin/rails console'

# Python Alias
alias py='python3'
# alias python2='/usr/local/bin/python'
# alias pip2='/usr/local/bin/pip'
# alias python='python3'
# alias pip='pip3'

# Sublime Text 3 Alias
alias sublime="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"
alias subl="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"

# Heroku deploy Alias
heroku() {
  if [[ $@ == "deploy" ]]; then
    command git push heroku master
  else
    command heroku "$@"
  fi
}

# Folder commands
project () { cd ~/projects/$1 }
compdef '_files -W ~/projects -/' project
alias p='project'

studies () { cd ~/studies/$1 }
compdef '_files -W ~/studies/ -/' studies
alias s='studies'
