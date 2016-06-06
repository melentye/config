#!/bin/sh
BASEDIR=$(dirname "$0")
ANSIBLE_PYTHON_VERSION="2.7.11"
ANSIBLE_PYTHON_VIRTUALENV_NAME="config"
if ! type "brew" > /dev/null; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew install pyenv
pyenv install $ANSIBLE_PYTHON_VERSION
echo $ANSIBLE_PYTHON_VIRTUALENV_NAME > $BASEDIR/.python-version
pyenv virtualenv $ANSIBLE_PYTHON_VERSION $ANSIBLE_PYTHON_VIRTUALENV_NAME
pip install -r $BASEDIR/requirements.txt