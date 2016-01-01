if [ -d "$HOME/Dev/go" ]; then
	export GOPATH="$HOME/Dev/go"
	export PATH="$PATH:$GOPATH/bin"
fi
if [ -d "$(brew --prefix)/opt/go/libexec/bin"]
    export PATH=$PATH:/usr/local/opt/go/libexec/bin	
fi
