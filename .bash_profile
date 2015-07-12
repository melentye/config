export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"
GIT_PS1_SHOWDIRTYSTATE=true
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
  if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
	# source http://neverstopbuilding.com/gitpro
	export PS1=$LIGHT_GRAY"\u@\h"'$(
			if [[ $(__git_ps1) =~ \*\)$ ]]
			# a file has been modified but not added
			then echo "'$YELLOW'"$(__git_ps1 " (%s)")
			elif [[ $(__git_ps1) =~ \+\)$ ]]
			# a file has been added, but not commited
			then echo "'$MAGENTA'"$(__git_ps1 " (%s)")
			# the state is clean, changes are commited
			else echo "'$CYAN'"$(__git_ps1 " (%s)")
			fi)'$BLUE" \w"$GREEN": "
	fi
fi

# Set current directory name as terminal title
# Source https://gist.github.com/phette23/5270658
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

# Ruby

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Java

if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# Python

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# pip should only run if there is a virtualenv currently activated
# export PIP_REQUIRE_VIRTUALENV=true

# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
# export WORKON_HOME=~/.virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh	
# workon default	

# Gradle	

if [ -d "$(brew --prefix)/Cellar/gradle/2.4" ]; then
	export GRADLE_HOME="$(brew --prefix)/Cellar/gradle/2.4"	
	export PATH=$GRADLE_HOME/bin:$PATH
fi

export GATLING_HOME=~/Dev/gatling-charts-highcharts-bundle-2.1.6
# export PATH=$GATLING_HOME/bin:$PATH

# Vagrant

# export VAGRANT_DEFAULT_PROVIDER=cloudstack
export VAGRANT_DEFAULT_PROVIDER=virtualbox

# Erlang/OTP

if [ -f "$HOME/.kerl/envs/R15B03-1-vanilla/activate" ]; then
  . "$HOME/.kerl/envs/R15B03-1-vanilla/activate"
fi

if [ -f "$(brew --prefix)/share/cracklib-words" ]; then
	export CRACKLIB_DICTPATH="$(brew --prefix)/share/cracklib-words"
fi

# Node Version Manager

if [ -d "$HOME/.nvm" ] && [ -f "$(brew --prefix nvm)/nvm.sh" ]; then
	export NVM_DIR=~/.nvm
	source $(brew --prefix nvm)/nvm.sh
fi

# Suspend Ctrl+S combination
stty -ixon 2> /dev/null

# Add ~/bin to PATH
if [ -d "$HOME/bin" ]; then
	export PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/Dev/go" ]; then
	export GOPATH="$HOME/Dev/go"
	export PATH="$PATH:$GOPATH/bin"
fi

# And /usr/local/sbin
export PATH="$PATH:/usr/local/sbin"

# Set Sublime as default editor
if which subl > /dev/null; then export EDITOR="subl -w"; fi

# Aliases
alias prof="$EDITOR ~/.bash_profile"
alias reprof=". ~/.bash_profile"

# Additional and private variables
USER_PROFILE_DIR="$HOME/.profile.d"

# source profile directory 
if [[ -d $USER_PROFILE_DIR && -r $USER_PROFILE_DIR && \
	-x $USER_PROFILE_DIR ]]; then
	for i in $(LC_ALL=C command ls "$USER_PROFILE_DIR"); do
		i=$USER_PROFILE_DIR/$i
		[[ ${i##*/} != @(*~|*.bak|*.swp|\#*\#|*.dpkg*|*.rpm@(orig|new|save)|Makefile*) \
			&& -f $i && -r $i ]] && . "$i"
	done
fi
